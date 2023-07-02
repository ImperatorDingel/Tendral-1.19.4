
Backpack:
    type: inventory
    inventory: chest
    title: <green><bold>Rucksack
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

Health_world:
    type: world
    debug: false
    events:
        after delta time secondly every:1:
        - run Health_actionbar
        - run Health_task
        after delta time secondly every:2:
        - run Mana_task
        - run Stamina_task
        - run health_passiv_regen
        on player heals because SATIATED:
        - determine cancelled
        on player heals because REGEN:
        - determine cancelled

Health_task:
    type: task
    debug: false
    script:
    - foreach <server.online_players_flagged[Profil]>:
        - health <[value]> <[value].flag[<[value].flag[Profil]>.Stats.Leben]>

Health_passiv_regen:
    type: task
    debug: true
    script:
    - foreach <server.online_players_flagged[Profil]> as:p:
        - if <[p].health> == <[p].health_max>:
            - foreach next
        - else:
            - define health <[p].health.add[<[p].flag[<[p].flag[Profil]>.Stats.Leben_regen]>]>
            - if <[health]> >= <[p].health_max>:
                - adjust <[p]> health:<[p].health_max>
            - else:
                - adjust <[p]> health:<[health]>


Health_actionbar:
    type: task
    debug: false
    script:
    - foreach <server.online_players_flagged[Profil]>:
        - stop if:<[value].has_flag[<[value].flag[Profil]>.settings.sidebar]>
        - if <[value].flag[<[value].flag[Profil]>.Difficulty]> == normal:
            - actionbar "<gold>۞ <green>❤ <bold><[value].health.round>/<[value].health_max.round> <aqua>☢ <bold><[value].flag[<[value].flag[Profil]>.Stats.Mana]>/<[value].flag[<[value].flag[Profil]>.Stats.ManaMax]> <blue>🛡 <bold><[value].flag[<[value].flag[Profil]>.Stats.Def]> <gold>۞" per_player targets:<[value]>
        - if <[value].flag[<[value].flag[Profil]>.Difficulty]> == hardcore:
            - actionbar "<gold>۞ <green>❤ <bold><[value].health.round>/<[value].health_max.round> <aqua>☢ <bold><[value].flag[<[value].flag[Profil]>.Stats.Mana]>/<[value].flag[<[value].flag[Profil]>.Stats.ManaMax]> <blue>🛡 <bold><[value].flag[<[value].flag[Profil]>.Stats.Def]> <white>☁ <bold><[value].flag[<[value].flag[Profil]>.Stats.Stamina]>/<[value].flag[<[value].flag[Profil]>.Stats.StaminaMax]> <gold>۞" per_player targets:<[value]>

Mana_task:
  type: task
  debug: false
  script:
  - foreach <server.online_players_flagged[Profil]>:
    - if <[value].flag[<[value].flag[Profil]>.Stats.Mana]> < <[value].flag[<[value].flag[Profil]>.Stats.ManaMax]>:
        - flag <[value]> <[value].flag[Profil]>.Stats.Mana:++

Stamina_task:
  type: task
  debug: false
  script:
  - foreach <server.online_players_flagged[Profil]>:
    - if <[value].flag[<[value].flag[Profil]>.Stats.Stamina]> < <[value].flag[<[value].flag[Profil]>.Stats.StaminaMax]>:
        - flag <[value]> <[value].flag[Profil]>.Stats.Stamina:++

Healthbar:
  type: procedure
  definitions: XP|MaxXP
  debug: false
  script:
    - define raw <[XP].div[<[MaxXP]>]>
    - define Prozent <[raw].mul[100].format_number[##.##]>
    - define list <list>
    - define zahl 0
    - repeat 20:
        - define zahl <[zahl].add[5]>
        - if <[zahl]> == 100:
          - if <[Prozent]> >= 99:
            - define finish <green>▇
            - define list <[list].include[<[finish]>]>
          - else:
            - define finish <white>▇
            - define list <[list].include[<[finish]>]>
        - else:
          - if <[Prozent]> >= <[zahl]>:
            - define finish <green>▇
            - define list <[list].include[<[finish]>]>
          - else:
            - define finish <white>▇
            - define list <[list].include[<[finish]>]>
    - determine <[list].unseparated.unescaped>