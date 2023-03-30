English_Blacksmith:
  type: data
  Blacksmith_0: Blacksmith 0
  Blacksmith_1: Blacksmith I
  Blacksmith_2: Blacksmith II
  Blacksmith_3: Blacksmith III
  Blacksmith_4: Blacksmith IV
  Blacksmith_5: Blacksmith V
  Blacksmith_6: Blacksmith VI
  Blacksmith_7: Blacksmith VII
  Blacksmith_8: Blacksmith VIII
  Blacksmith_9: Blacksmith IX
  Blacksmith_10: Blacksmith X
  Blacksmith_11: Blacksmith XI
  Blacksmith_12: Blacksmith XII
  Blacksmith_13: Blacksmith XIII
  Blacksmith_14: Blacksmith XIV
  Blacksmith_15: Blacksmith XV
  Blacksmith_16: Blacksmith XVI
  Blacksmith_17: Blacksmith XVII
  Blacksmith_18: Blacksmith XVIII
  Blacksmith_19: Blacksmith XIX
  Blacksmith_20: Blacksmith XX
  Blacksmith_max: 20
  Blacksmith_red: Erreiche für die nächsten Stufen erst
  Blacksmith_stats: ❈ VER +1

German_Blacksmith:
  type: data
  Blacksmith_0: Schmied 0
  Blacksmith_1: Schmied I
  Blacksmith_2: Schmied II
  Blacksmith_3: Schmied III
  Blacksmith_4: Schmied IV
  Blacksmith_5: Schmied V
  Blacksmith_6: Schmied VI
  Blacksmith_7: Schmied VII
  Blacksmith_8: Schmied VIII
  Blacksmith_9: Schmied IX
  Blacksmith_10: Schmied X
  Blacksmith_11: Schmied XI
  Blacksmith_12: Schmied XII
  Blacksmith_13: Schmied XIII
  Blacksmith_14: Schmied XIV
  Blacksmith_15: Schmied XV
  Blacksmith_16: Schmied XVI
  Blacksmith_17: Schmied XVII
  Blacksmith_18: Schmied XVIII
  Blacksmith_19: Schmied XIX
  Blacksmith_20: Schmied XX
  Blacksmith_max: 20
  Blacksmith_red: Erreiche für die nächsten Stufen erst
  Blacksmith_stats: ❈ VER +1

BlacksmithLevel_world:
  type: world
  debug: false
  events:
    after player joins:
    - inject BlacksmithLevel
    - run BlacksmithXPBar
    after player quits:
    - inject BlacksmithLevel
    after delta time secondly every:1:
    - inject BlacksmithLevel
    after delta time minutely every:1:
    - run BlacksmithXPBar

BlacksmithLevel:
    type: task
    debug: false
    script:
      - stop if:<server.online_players.is_empty>
      - foreach <server.online_players_flagged[Profil]> as:p:
        - define exp <[p].flag[<[p].flag[Profil]>.Professions.Blacksmith.Exp]>
        - define exptarget <[p].flag[<[p].flag[Profil]>.Professions.Blacksmith.Target]>
        - if <[Exp]> >= <[exptarget]>:
          - flag <[p]> <[p].flag[Profil]>.Professions.Blacksmith.Level:++
          - flag <[p]> <[p].flag[Profil]>.Professions.Blacksmith.Exp:-:<[p].flag[<[p].flag[Profil]>.Professions.Blacksmith.Target]>
          - flag <[p]> <[p].flag[Profil]>.Professions.Blacksmith.Target:*:2
          - narrate targets:<[p]> "<green><bold><script[Blacksmith].data_key[Blacksmith_<[p].flag[<[p].flag[Profil]>.Professions.Blacksmith.Level].sub[1]>]> erhöhte sich auf <green><bold><script[Blacksmith].data_key[Blacksmith_<[p].flag[<[p].flag[Profil]>.Professions.Blacksmith.Level]>]>" per_player
          - playsound <[p]> sound:ENTITY_PLAYER_LEVELUP volume:1.0 pitch:0.6

BlacksmithXPBar:
    type: task
    debug: false
    script:
    - foreach <server.online_players_flagged[Profil]> as:p:
        - define list <list>
        - define zahl 0
        - define exp <[p].flag[<[p].flag[Profil]>.Professions.Blacksmith.Exp]>
        - define exptarget <[p].flag[<[p].flag[Profil]>.Professions.Blacksmith.Target]>
        - define raw <[exp].div[<[exptarget]>]>
        - define Prozent <[raw].mul[100].format_number[##.##]>
        - flag <[p]> <[p].flag[Profil]>.ExpProzent.BlacksmithProzent:<[Prozent]>
        - repeat 20:
          - define zahl <[zahl].add[5]>
          - if <[zahl]> == 100:
            - if <[p].flag[<[p].flag[Profil]>.ExpProzent.BlacksmithProzent]> >= 99:
              - define finish <green>-
              - define list <[list].include[<[finish]>]>
            - else:
              - define finish <white>-
              - define list <[list].include[<[finish]>]>
          - else:
            - if <[p].flag[<[p].flag[Profil]>.ExpProzent.BlacksmithProzent]> >= <[zahl]>:
              - define finish <green>-
              - define list <[list].include[<[finish]>]>
            - else:
              - define finish <white>-
              - define list <[list].include[<[finish]>]>
          - flag <[p]> <[p].flag[Profil]>.ExpBar.Blacksmith:<[list].unseparated>
