Level_world:
  type: world
  debug: false
  events:
    after delta time secondly every:1:
    - run Level_task


Level_task:
    type: task
    debug: false
    script:
      - stop if:<server.online_players.is_empty>
      - foreach <server.online_players_flagged[Profil]> as:p:
        - define exp <[p].flag[<[p].flag[Profil]>.EXP.Exp]>
        - define exptarget <[p].flag[<[p].flag[Profil]>.EXP.Target]>
        - if <[p].flag[<[p].flag[Profil]>.Level]> >= <script[Level_settings].parsed_key[Maxlevel]>:
          - foreach next
        - if <[Exp]> >= <[exptarget]>:
          - flag <[p]> <[p].flag[Profil]>.Level:++
          - flag <[p]> <[p].flag[Profil]>.EXP.Exp:-:<[p].flag[<[p].flag[Profil]>.EXP.Target]>
          - flag <[p]> <[p].flag[Profil]>.EXP.Target:*:<script[Level_settings].parsed_key[Multiplier]>
          - flag <[p]> <[p].flag[Profil]>.Stats.Leben:++
          - toast "<gold><bold>Level erhöht von <[p].flag[<[p].flag[Profil]>.Level].sub[1]> zu <[p].flag[<[p].flag[Profil]>.Level]>" icon:player_head[skull_skin=<[p].uuid>] targets:<[p]>
          - playsound <[p]> sound:ENTITY_PLAYER_LEVELUP volume:1.0 pitch:0.6

Level_data:
  type: data
  Level:
  - "<white><bold><&m>======================"
  - "<gold><bold>Level Up!"
  - "<gold><bold>Level erhöht von <player.flag[Profil.Level].sub[1]> zu <player.flag[Profil.Level]>"
  - "<white><bold><&m>======================"
