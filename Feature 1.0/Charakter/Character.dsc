
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

Health_task:
    type: task
    debug: false
    script:
    - foreach <server.online_players_flagged[Profil]>:
        - health <[value]> <[value].flag[<[value].flag[Profil]>.Stats.Leben]>

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