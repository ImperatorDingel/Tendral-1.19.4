Rassen_auswahl_data:
    type: data
    Rassenliste:
    - Mensch
    - Elf
    - Zwerg

Rassen_auswahl_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: Rassen auswahl
    procedural items:
    - define result <list>
    - foreach <script[rassen_auswahl_data].parsed_key[Rassenliste]>:
        - choose <[value]>:
            - case Mensch:
                - define item player_head[display_name=<green><bold>Human;skull_skin=Smith]
            - case Elf:
                - define item player_head[display_name=<green><bold>Elf;skull_skin=187Itachi]
            - case Zwerg:
                - define item player_head[display_name=<green><bold>Zwerg;skull_skin=Poindexter94]
        - define result <[result].include[<[item]>]>
    - determine <[result]>
    slots:
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [air] [air] [] [] [] [air] [air] [air]
    - [air] [air] [air] [air] [air] [air] [air] [v] [air]

Rassen_auswahl_click_handler:
    type: world
    events:
        on player clicks in Rassen_auswahl_inventory slot:13|14|15:
        - choose <context.slot>:
            - case 13:
                - flag <player> profil_creation.Rasse:Mensch
                - inventory open d:Schwierigkeit_auswahl_inventory
            - case 14:
                - flag <player> profil_creation.Rasse:Elf
                - inventory open d:Schwierigkeit_auswahl_inventory
            - case 15:
                - flag <player> profil_creation.Rasse:Zwerg
                - inventory open d:Schwierigkeit_auswahl_inventory