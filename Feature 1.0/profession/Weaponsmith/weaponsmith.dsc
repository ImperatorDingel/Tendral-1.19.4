English_weaponsmith:
  type: data
  weaponsmith_0: weaponsmith 0
  weaponsmith_1: weaponsmith I
  weaponsmith_2: weaponsmith II
  weaponsmith_3: weaponsmith III
  weaponsmith_4: weaponsmith IV
  weaponsmith_5: weaponsmith V
  weaponsmith_6: weaponsmith VI
  weaponsmith_7: weaponsmith VII
  weaponsmith_8: weaponsmith VIII
  weaponsmith_9: weaponsmith IX
  weaponsmith_10: weaponsmith X
  weaponsmith_11: weaponsmith XI
  weaponsmith_12: weaponsmith XII
  weaponsmith_13: weaponsmith XIII
  weaponsmith_14: weaponsmith XIV
  weaponsmith_15: weaponsmith XV
  weaponsmith_16: weaponsmith XVI
  weaponsmith_17: weaponsmith XVII
  weaponsmith_18: weaponsmith XVIII
  weaponsmith_19: weaponsmith XIX
  weaponsmith_20: weaponsmith XX
  weaponsmith_max: 20
  weaponsmith_red: Erreiche für die nächsten Stufen erst
  weaponsmith_stats: ❈ VER +1

German_weaponsmith:
  type: data
  weaponsmith_0: Waffenschmied 0
  weaponsmith_1: Waffenschmied I
  weaponsmith_2: Waffenschmied II
  weaponsmith_3: Waffenschmied III
  weaponsmith_4: Waffenschmied IV
  weaponsmith_5: Waffenschmied V
  weaponsmith_6: Waffenschmied VI
  weaponsmith_7: Waffenschmied VII
  weaponsmith_8: Waffenschmied VIII
  weaponsmith_9: Waffenschmied IX
  weaponsmith_10: Waffenschmied X
  weaponsmith_11: Waffenschmied XI
  weaponsmith_12: Waffenschmied XII
  weaponsmith_13: Waffenschmied XIII
  weaponsmith_14: Waffenschmied XIV
  weaponsmith_15: Waffenschmied XV
  weaponsmith_16: Waffenschmied XVI
  weaponsmith_17: Waffenschmied XVII
  weaponsmith_18: Waffenschmied XVIII
  weaponsmith_19: Waffenschmied XIX
  weaponsmith_20: Waffenschmied XX
  weaponsmith_max: 20
  weaponsmith_red: Erreiche für die nächsten Stufen erst
  weaponsmith_stats: ❈ VER +1

weaponsmithLevel_world:
  type: world
  debug: false
  events:
    after delta time secondly every:1:
    - run weaponsmithLevel


weaponsmithLevel:
    type: task
    debug: false
    script:
      - stop if:<server.online_players.is_empty>
      - foreach <server.online_players_flagged[Profil]> as:p:
        - define exp <[p].flag[<[p].flag[Profil]>.Professions.weaponsmith.Exp]>
        - define exptarget <[p].flag[<[p].flag[Profil]>.Professions.weaponsmith.Target]>
        - if <[p].flag[<[p].flag[profil]>.Professions.Weaponsmith.Level]> >= <script[professions_settings].parsed_key[Weaponsmith.Maxlevel]>:
          - foreach next
        - if <[Exp]> >= <[exptarget]>:
          - flag <[p]> <[p].flag[Profil]>.Professions.weaponsmith.Level:++
          - flag <[p]> <[p].flag[Profil]>.Professions.weaponsmith.Exp:-:<[p].flag[<[p].flag[Profil]>.Professions.weaponsmith.Target]>
          - flag <[p]> <[p].flag[Profil]>.Professions.weaponsmith.Target:*:<script[professions_settings].parsed_key[Weaponsmith.Multiplier]>
          - narrate targets:<[p]> "<green><bold><script[weaponsmith].data_key[weaponsmith_<[p].flag[<[p].flag[Profil]>.Professions.weaponsmith.Level].sub[1]>]> erhöhte sich auf <green><bold><script[weaponsmith].data_key[weaponsmith_<[p].flag[<[p].flag[Profil]>.Professions.weaponsmith.Level]>]>" per_player
          - playsound <[p]> sound:ENTITY_PLAYER_LEVELUP volume:1.0 pitch:0.6
