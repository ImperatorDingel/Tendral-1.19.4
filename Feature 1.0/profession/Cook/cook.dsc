English_Cook:
  type: data
  Cook_0: Cook 0
  Cook_1: Cook I
  Cook_2: Cook II
  Cook_3: Cook III
  Cook_4: Cook IV
  Cook_5: Cook V
  Cook_6: Cook VI
  Cook_7: Cook VII
  Cook_8: Cook VIII
  Cook_9: Cook IX
  Cook_10: Cook X
  Cook_11: Cook XI
  Cook_12: Cook XII
  Cook_13: Cook XIII
  Cook_14: Cook XIV
  Cook_15: Cook XV
  Cook_16: Cook XVI
  Cook_17: Cook XVII
  Cook_18: Cook XVIII
  Cook_19: Cook XIX
  Cook_20: Cook XX
  Cook_max: 20
  Cook_red: Erreiche für die nächsten Stufen erst
  Cook_stats: ❈ VER +1

German_Cook:
  type: data
  Cook_0: Koch 0
  Cook_1: Koch I
  Cook_2: Koch II
  Cook_3: Koch III
  Cook_4: Koch IV
  Cook_5: Koch V
  Cook_6: Koch VI
  Cook_7: Koch VII
  Cook_8: Koch VIII
  Cook_9: Koch IX
  Cook_10: Koch X
  Cook_11: Koch XI
  Cook_12: Koch XII
  Cook_13: Koch XIII
  Cook_14: Koch XIV
  Cook_15: Koch XV
  Cook_16: Koch XVI
  Cook_17: Koch XVII
  Cook_18: Koch XVIII
  Cook_19: Koch XIX
  Cook_20: Koch XX
  Cook_max: 20
  Cook_red: Erreiche für die nächsten Stufen erst
  Cook_stats: ❈ VER +1

CookLevel_world:
  type: world
  debug: false
  events:
    after delta time secondly every:1:
    - run CookLevel

CookLevel:
    type: task
    debug: false
    script:
      - stop if:<server.online_players.is_empty>
      - foreach <server.online_players_flagged[Profil]> as:p:
        - define exp <[p].flag[<[p].flag[Profil]>.Professions.Cook.Exp]>
        - define exptarget <[p].flag[<[p].flag[Profil]>.Professions.Cook.Target]>
        - if <[p].flag[<[p].flag[profil]>.Professions.Cook.Level]> >= <script[professions_settings].parsed_key[Cook.Maxlevel]>:
          - foreach next
        - if <[Exp]> >= <[exptarget]>:
          - flag <[p]> <[p].flag[Profil]>.Professions.Cook.Level:++
          - flag <[p]> <[p].flag[Profil]>.Professions.Cook.Exp:-:<[p].flag[<[p].flag[Profil]>.Professions.Cook.Target]>
          - flag <[p]> <[p].flag[Profil]>.Professions.Cook.Target:*:<script[professions_settings].parsed_key[Blacksmith.Multiplier]>
          - narrate targets:<[p]> "<green><bold><script[Cook].data_key[Cook_<[p].flag[<[p].flag[Profil]>.Professions.Cook.Level].sub[1]>]> erhöhte sich auf <green><bold><script[Cook].data_key[Cook_<[p].flag[<[p].flag[Profil]>.Professions.Cook.Level]>]>" per_player
          - playsound <[p]> sound:ENTITY_PLAYER_LEVELUP volume:1.0 pitch:0.6
