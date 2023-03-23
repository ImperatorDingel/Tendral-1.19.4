English_Combat:
  type: data
  Combat_0: Combat 0
  Combat_1: Combat I
  Combat_2: Combat II
  Combat_3: Combat III
  Combat_4: Combat IV
  Combat_5: Combat V
  Combat_6: Combat VI
  Combat_7: Combat VII
  Combat_8: Combat VIII
  Combat_9: Combat IX
  Combat_10: Combat X
  Combat_11: Combat XI
  Combat_12: Combat XII
  Combat_13: Combat XIII
  Combat_14: Combat XIV
  Combat_15: Combat XV
  Combat_16: Combat XVI
  Combat_17: Combat XVII
  Combat_18: Combat XVIII
  Combat_19: Combat XIX
  Combat_20: Combat XX
  Combat_max: 20
  Combat_red: Erreiche für die nächsten Stufen erst
  Combat_stats: ❈ DMG +1

German_Combat:
  type: data
  Combat_0: Kämpfer 0
  Combat_1: Kämpfer I
  Combat_2: Kämpfer II
  Combat_3: Kämpfer III
  Combat_4: Kämpfer IV
  Combat_5: Kämpfer V
  Combat_6: Kämpfer VI
  Combat_7: Kämpfer VII
  Combat_8: Kämpfer VIII
  Combat_9: Kämpfer IX
  Combat_10: Kämpfer X
  Combat_11: Kämpfer XI
  Combat_12: Kämpfer XII
  Combat_13: Kämpfer XIII
  Combat_14: Kämpfer XIV
  Combat_15: Kämpfer XV
  Combat_16: Kämpfer XVI
  Combat_17: Kämpfer XVII
  Combat_18: Kämpfer XVIII
  Combat_19: Kämpfer XIX
  Combat_20: Kämpfer XX
  Combat_max: 20
  Combat_red: Erreiche für die nächsten Stufen erst
  Combat_stats: ❈ DMG +1

CombatLevel_world:
  type: world
  debug: false
  events:
    after player joins:
    - inject CombatLevel
    - run CombatXPBar
    after player quits:
    - inject CombatLevel
    after delta time secondly every:1:
    - inject CombatLevel
    - inject CombatXPBar
    after delta time minutely every:1:
    - run CombatXPBar

CombatLevel:
    type: task
    debug: false
    script:
      - stop if:<server.online_players.is_empty>
      - foreach <server.online_players_flagged[Profil]> as:p:
        - define exp <[p].flag[<[p].flag[Profil]>.Skills.Combat.Exp]>
        - define exptarget <[p].flag[<[p].flag[Profil]>.Skills.Combat.Target]>
        - if <[Exp]> >= <[exptarget]>:
          - flag <[p]> <[p].flag[Profil]>.Skills.Combat.Level:++
          - flag <[p]> <[p].flag[Profil]>.Skills.Combat.Exp:-:<[p].flag[<[p].flag[Profil]>.Skills.Combat.Target]>
          - flag <[p]> <[p].flag[Profil]>.Skills.Combat.Target:*:1.25
          - flag <[p]> <[p].flag[Profil]>.Stats.Dmg:++
          - toast "<gold><bold>Level erhöht von <script[German_Combat].data_key[Combat_<[p].flag[<[p].flag[Profil]>.Skills.Combat.Level].sub[1]>]> zu <script[German_Combat].data_key[Combat_<[p].flag[<[p].flag[Profil]>.Skills.Combat.Level]>]>" icon:iron_sword targets:<[p]>
          - playsound <[p]> sound:ENTITY_PLAYER_LEVELUP volume:1.0 pitch:0.6

CombatXPBar:
    type: task
    debug: false
    script:
    - foreach <server.online_players_flagged[Profil]> as:p:
        - define list <list>
        - define zahl 0
        - define exp <[p].flag[<[p].flag[Profil]>.Skills.Combat.Exp]>
        - define exptarget <[p].flag[<[p].flag[Profil]>.Skills.Combat.Target]>
        - define raw <[exp].div[<[exptarget]>]>
        - define Prozent <[raw].mul[100].format_number[##.##]>
        - flag <[p]> <[p].flag[Profil]>.ExpProzent.CombatProzent:<[Prozent]>
        - repeat 20:
          - define zahl <[zahl].add[5]>
          - if <[zahl]> == 100:
            - if <[p].flag[<[p].flag[Profil]>.ExpProzent.CombatProzent]> >= 99:
              - define finish <green>-
              - define list <[list].include[<[finish]>]>
            - else:
              - define finish <white>-
              - define list <[list].include[<[finish]>]>
          - else:
            - if <[p].flag[<[p].flag[Profil]>.ExpProzent.CombatProzent]> >= <[zahl]>:
              - define finish <green>-
              - define list <[list].include[<[finish]>]>
            - else:
              - define finish <white>-
              - define list <[list].include[<[finish]>]>
        - flag <[p]> <[p].flag[Profil]>.ExpBar.Combat:<[list].unseparated>