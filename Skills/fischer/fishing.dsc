English_Fishing:
  type: data
  Fishing_0: Fishing 0
  Fishing_1: Fishing I
  Fishing_2: Fishing II
  Fishing_3: Fishing III
  Fishing_4: Fishing IV
  Fishing_5: Fishing V
  Fishing_6: Fishing VI
  Fishing_7: Fishing VII
  Fishing_8: Fishing VIII
  Fishing_9: Fishing IX
  Fishing_10: Fishing X
  Fishing_11: Fishing XI
  Fishing_12: Fishing XII
  Fishing_13: Fishing XIII
  Fishing_14: Fishing XIV
  Fishing_15: Fishing XV
  Fishing_16: Fishing XVI
  Fishing_17: Fishing XVII
  Fishing_18: Fishing XVIII
  Fishing_19: Fishing XIX
  Fishing_20: Fishing XX
  Fishing_max: 20
  Fishing_red: Erreiche für die nächsten Stufen erst
  Fishing_stats: ❈ Speed +1

German_Fishing:
  type: data
  Fishing_0: Fischer 0
  Fishing_1: Fischer I
  Fishing_2: Fischer II
  Fishing_3: Fischer III
  Fishing_4: Fischer IV
  Fishing_5: Fischer V
  Fishing_6: Fischer VI
  Fishing_7: Fischer VII
  Fishing_8: Fischer VIII
  Fishing_9: Fischer IX
  Fishing_10: Fischer X
  Fishing_11: Fischer XI
  Fishing_12: Fischer XII
  Fishing_13: Fischer XIII
  Fishing_14: Fischer XIV
  Fishing_15: Fischer XV
  Fishing_16: Fischer XVI
  Fishing_17: Fischer XVII
  Fishing_18: Fischer XVIII
  Fishing_19: Fischer XIX
  Fishing_20: Fischer XX
  Fishing_max: 20
  Fishing_red: Erreiche für die nächsten Stufen erst
  Fishing_stats: ❈ Speed +1

FishingLevel_world:
  type: world
  debug: false
  events:
    after player joins:
    - inject FishingLevel
    - run FishingXPBar
    after player quits:
    - inject FishingLevel
    after delta time secondly every:1:
    - inject FishingLevel
    after delta time minutely every:1:
    - run FishingXPBar

FishingLevel:
    type: task
    debug: false
    script:
      - stop if:<server.online_players.is_empty>
      - foreach <server.online_players_flagged[Profil]> as:p:
        - define exp <[p].flag[<[p].flag[Profil]>.Skills.Fishing.Exp]>
        - define exptarget <[p].flag[<[p].flag[Profil]>.Skills.Fishing.Target]>
        - if <[Exp]> >= <[exptarget]>:
          - flag <[p]> <[p].flag[Profil]>.Skills.Fishing.Level:++
          - flag <[p]> <[p].flag[Profil]>.Skills.Fishing.Exp:-:<[p].flag[<[p].flag[Profil]>.Skills.Fishing.Target]>
          - flag <[p]> <[p].flag[Profil]>.Skills.Fishing.Target:*:1.25
          - flag <[p]> <[p].flag[Profil]>.Stats.Speed:++
          - toast "<gold><bold>Level up:<n><script[German_Fishing].data_key[Fishing_<[p].flag[<[p].flag[Profil]>.Skills.Fishing.Level].sub[1]>]> -> <script[German_Fishing].data_key[Fishing_<[p].flag[<[p].flag[Profil]>.Skills.Fishing.Level]>]>" icon:fishing_rod targets:<[p]>
          - playsound <[p]> sound:ENTITY_PLAYER_LEVELUP volume:1.0 pitch:0.6

FishingXPBar:
    type: task
    debug: false
    script:
    - foreach <server.online_players_flagged[Profil]> as:p:
        - define list <list>
        - define zahl 0
        - define exp <[p].flag[<[p].flag[Profil]>.Skills.Fishing.Exp]>
        - define exptarget <[p].flag[<[p].flag[Profil]>.Skills.Fishing.Target]>
        - define raw <[exp].div[<[exptarget]>]>
        - define Prozent <[raw].mul[100].format_number[##.##]>
        - flag <[p]> <[p].flag[Profil]>.ExpProzent.FishingProzent:<[Prozent]>
        - repeat 20:
          - define zahl <[zahl].add[5]>
          - if <[zahl]> == 100:
            - if <[p].flag[<[p].flag[Profil]>.ExpProzent.FishingProzent]> >= 99:
              - define finish <green>-
              - define list <[list].include[<[finish]>]>
            - else:
              - define finish <white>-
              - define list <[list].include[<[finish]>]>
          - else:
            - if <[p].flag[<[p].flag[Profil]>.ExpProzent.FishingProzent]> >= <[zahl]>:
              - define finish <green>-
              - define list <[list].include[<[finish]>]>
            - else:
              - define finish <white>-
              - define list <[list].include[<[finish]>]>
          - flag <[p]> <[p].flag[Profil]>.ExpBar.Fishing:<[list].unseparated>