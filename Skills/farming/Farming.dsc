English_Farming:
  type: data
  Farming_0: Farming 0
  Farming_1: Farming I
  Farming_2: Farming II
  Farming_3: Farming III
  Farming_4: Farming IV
  Farming_5: Farming V
  Farming_6: Farming VI
  Farming_7: Farming VII
  Farming_8: Farming VIII
  Farming_9: Farming IX
  Farming_10: Farming X
  Farming_11: Farming XI
  Farming_12: Farming XII
  Farming_13: Farming XIII
  Farming_14: Farming XIV
  Farming_15: Farming XV
  Farming_16: Farming XVI
  Farming_17: Farming XVII
  Farming_18: Farming XVIII
  Farming_19: Farming XIX
  Farming_20: Farming XX
  Farming_max: 20
  Farming_red: Erreiche für die nächsten Stufen erst
  Farming_stats: ❈ LP +1

German_Farming:
  type: data
  Farming_0: Farmer 0
  Farming_1: Farmer I
  Farming_2: Farmer II
  Farming_3: Farmer III
  Farming_4: Farmer IV
  Farming_5: Farmer V
  Farming_6: Farmer VI
  Farming_7: Farmer VII
  Farming_8: Farmer VIII
  Farming_9: Farmer IX
  Farming_10: Farmer X
  Farming_11: Farmer XI
  Farming_12: Farmer XII
  Farming_13: Farmer XIII
  Farming_14: Farmer XIV
  Farming_15: Farmer XV
  Farming_16: Farmer XVI
  Farming_17: Farmer XVII
  Farming_18: Farmer XVIII
  Farming_19: Farmer XIX
  Farming_20: Farmer XX
  Farming_max: 20
  Farming_red: Erreiche für die nächsten Stufen erst
  Farming_stats: ❈ LP +1

FarmingLevel_world:
  type: world
  debug: false
  events:
    after player joins:
    - inject FarmingLevel
    - run FarmingXPBar
    after player quits:
    - inject FarmingLevel
    after delta time secondly every:1:
    - inject FarmingLevel
    after delta time minutely every:1:
    - run FarmingXPBar

FarmingLevel:
    type: task
    debug: false
    script:
      - stop if:<server.online_players.is_empty>
      - foreach <server.online_players_flagged[Profil]> as:p:
        - define exp <[p].flag[<[p].flag[Profil]>.Skills.Farming.Exp]>
        - define exptarget <[p].flag[<[p].flag[Profil]>.Skills.Farming.Target]>
        - if <[Exp]> >= <[exptarget]>:
          - flag <[p]> <[p].flag[Profil]>.Skills.Farming.Level:++
          - flag <[p]> <[p].flag[Profil]>.Skills.Farming.Exp:-:<[p].flag[<[p].flag[Profil]>.Skills.Farming.Target]>
          - flag <[p]> <[p].flag[Profil]>.Skills.Farming.Target:*:1.25
          - flag <[p]> <[p].flag[Profil]>.Skills.Farming.MaxDrop:++
          - flag <[p]> <[p].flag[Profil]>.Stats.Leben:++
          - toast "<gold><bold>Level erhöht von <script[German_Farming].data_key[Farming_<[p].flag[<[p].flag[Profil]>.Skills.Farming.Level].sub[1]>]> zu <script[German_Farming].data_key[Farming_<[p].flag[<[p].flag[Profil]>.Skills.Farming.Level]>]>" icon:iron_hoe targets:<[p]>
          - playsound <[p]> sound:ENTITY_PLAYER_LEVELUP volume:1.0 pitch:0.6

FarmingXPBar:
    type: task
    debug: false
    script:
    - foreach <server.online_players_flagged[Profil]> as:p:
        - define list <list>
        - define zahl 0
        - define exp <[p].flag[<[p].flag[Profil]>.Skills.Farming.Exp]>
        - define exptarget <[p].flag[<[p].flag[Profil]>.Skills.Farming.Target]>
        - define raw <[exp].div[<[exptarget]>]>
        - define Prozent <[raw].mul[100].format_number[##.##]>
        - flag <[p]> <[p].flag[Profil]>.ExpProzent.FarmingProzent:<[Prozent]>
        - repeat 20:
          - define zahl <[zahl].add[5]>
          - if <[zahl]> == 100:
            - if <[p].flag[<[p].flag[Profil]>.ExpProzent.FarmingProzent]> >= 99:
              - define finish <green>-
              - define list <[list].include[<[finish]>]>
            - else:
              - define finish <white>-
              - define list <[list].include[<[finish]>]>
          - else:
            - if <[p].flag[<[p].flag[Profil]>.ExpProzent.FarmingProzent]> >= <[zahl]>:
              - define finish <green>-
              - define list <[list].include[<[finish]>]>
            - else:
              - define finish <white>-
              - define list <[list].include[<[finish]>]>
          - flag <[p]> <[p].flag[Profil]>.ExpBar.Farming:<[list].unseparated>