Schwierigkeit_auswahl_data:
    type: data
    Schwierigkeitliste:

    - Normal
    - Hardcore

Schwierigkeit_auswahl_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: Schwierigkeit auswahl
    procedural items:
    - define result <list>
    - foreach <script[Schwierigkeit_auswahl_data].parsed_key[Schwierigkeitliste]>:
        - choose <[value]>:
            - case Normal:
                - define item campfire[display_name=<green><bold>Normal]
            - case Hardcore:
                - define item soul_campfire[display_name=<red><bold>Hardcore]
        - define result <[result].include[<[item]>]>
    - determine <[result]>
    slots:
    - [air] [air] [air] [] [air] [] [air] [air] [air]

Schwierigkeit_auswahl_click_handler:
    type: world
    events:
        on player clicks in Schwierigkeit_auswahl_inventory slot:4|6:
        - choose <context.slot>:
            - case 4:
                - flag <player> profil_creation.Schwierigkeit:Normal

                - note <inventory[Rucksack_inventory]> as:<player.flag[Profil_creation.Profil]>_<player.uuid>_Backpack
                - flag <player> <player.flag[Profil_creation.Profil]>:<script[Rassen_data].parsed_key[<player.flag[profil_creation.Rasse]>]>
                - flag <player> Profil:<player.flag[Profil_creation.Profil]>
                - flag <player> profil_creation:!
                - teleport <player> spawn
                - inventory set o:Rucksack_item slot:8
                - inventory set o:Menu_item slot:9
            - case 6:
                - flag <player> profil_creation.Schwierigkeit:Hardcore

                - note <inventory[Rucksack_inventory]> as:<player.flag[Profil_creation.Profil]>_<player.uuid>_Backpack
                - flag <player> <player.flag[Profil_creation.Profil]>:<script[Rassen_data].parsed_key[<player.flag[profil_creation.Rasse]>]>
                - flag <player> Profil:<player.flag[Profil_creation.Profil]>
                - flag <player> profil_creation:!
                - teleport <player> spawn
                - inventory set o:Rucksack_item slot:8
                - inventory set o:Menu_item slot:9
