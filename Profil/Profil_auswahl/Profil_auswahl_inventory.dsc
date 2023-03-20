Profil_auswahl_data:
    type: data
    Profilliste:

    - "Free"
    - "Free"
    - "Free"
    - "Free"
    
    - "Settings"

    - "Free"
    - "Free"
    - "Free"
    - "Free"
    
    - "Werbung"

    - "Bronze"
    - "Bronze"
    - "Bronze"
    - "Bronze"
    
    - "Werbung"

    - "Bronze"
    - "Bronze"
    - "Bronze"
    - "Bronze"
    
    - "Werbung"

    ProfilInfo:
    - "<gold><bold>۞<gold> >> Charakter Info << <bold>۞"
    - "<gold><bold>۞<gold> Rasse >> <[Race]>"
    - "<gold><bold>۞<gold> Level >> <[Level]>"
    - "<gold><bold>۞<gold> Schwierigkeit >> <[Difficulty]>"
    - <empty>
    - <empty>
    - "<green>[Links Klick zum auswählen]"
    - "<red>[Rechts Klick zum löschen]"
    - "erstellt am <[time].format[dd/MM/yyyy]>"




Profil_auswahl_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: <gray><bold>Profil auswahl
    debug: true
    procedural items:
    - define result <list>
    - define anzahl 0
    - foreach <script[profil_auswahl_data].parsed_key[Profilliste]>:
        - define Slot Profil_<[loop_index]>
        - choose <[value]>:
            - case Free:
                - define anzahl:++
                - if <player.has_flag[<[slot]>]>:
                    - define Profil "Profil <[anzahl]>"
                    - define Race <player.flag[<[slot]>.race]>
                    - define Level <player.flag[<[slot]>.level]>
                    - define Difficulty <player.flag[<[slot]>.difficulty]>
                    - define time <player.flag[<[slot]>.creation_time]>
                    - choose <[Race]>:
                        - case Mensch:
                            - define skin Smith
                        - case Elf:
                            - define skin 187Itachi
                        - case Zwerg:
                            - define skin Poindexter94
                    - define item player_head[display_name=<gold><bold>۞<&sp><green><bold><player.name><&sp>[<[Profil]>]<&sp><gold><bold>۞;Lore=<script[profil_auswahl_data].parsed_key[ProfilInfo].separated_by[<n>]>;skull_skin=<[skin]>]
                - else:
                    - define item lime_stained_glass_pane[display_name=<green><bold>Profil<&sp><[anzahl]>]
            - case Bronze:
                - define anzahl:++
                - if <player.has_flag[<[slot]>]>:
                    - define item player_head[display_name=<green><bold><[Slot]>]
                - else:
                    - if <player.has_permission[tendral.bronze]>:
                        - define item lime_stained_glass_pane[display_name=<green><bold>Profil<&sp><[anzahl]>]
                    - else:
                        - define item red_stained_glass_pane[display_name=<red><bold>Profil<&sp><[anzahl]>]
            - case Settings:
                - define item yellow_stained_glass_pane
            - case Werbung:
                - define item magenta_stained_glass_pane
        - define result <[result].include[<[item]>]>
    - determine <[result]>
    slots:
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [] [] [] [] [air] [air] [] [air]
    - [air] [] [] [] [] [air] [air] [] [air]
    - [air] [] [] [] [] [air] [air] [] [air]
    - [air] [] [] [] [] [air] [air] [] [air]
    - [air] air] [air] [air] [air] [air] [air] [air] [air]

Profil_auswahl_click_handler:
    type: world
    debug: true
    events:
        on player right clicks in Profil_auswahl_inventory slot:11|12|13|14|17|20|21|22|23|26|29|30|31|32|35|38|39|40|41|44:
        - choose <context.slot>:
          #Erste Reihe
            #Profil 1
            - case 11:
                - flag <player> Profil_1:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 2
            - case 12:
                - flag <player> Profil_2:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 3
            - case 13:
                - flag <player> Profil_3:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 4
            - case 14:
                - flag <player> Profil_4:!
                - inventory open d:Profil_auswahl_inventory
            #Settings
            #- case 17:
          #Zweite Reihe
            #Profil 6
            - case 20:
                - flag <player> Profil_6:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 7
            - case 21:
                - flag <player> Profil_7:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 8
            - case 22:
                - flag <player> Profil_8:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 9
            - case 23:
                - flag <player> Profil_9:!
                - inventory open d:Profil_auswahl_inventory
            #Werbung
            #- case 26:
          #Dritte Reihe
            #Profil 11
            - case 29:
                - flag <player> Profil_11:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 12
            - case 30:
                - flag <player> Profil_12:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 13
            - case 31:
                - flag <player> Profil_13:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 14
            - case 32:
                - flag <player> Profil_14:!
                - inventory open d:Profil_auswahl_inventory
            #Werbung
            #- case 35:
          #Vierte Reihe
            #Profil 16
            - case 38:
                - flag <player> Profil_16:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 17
            - case 39:
                - flag <player> Profil_17:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 18
            - case 40:
                - flag <player> Profil_18:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 19
            - case 41:
                - flag <player> Profil_19:!
                - inventory open d:Profil_auswahl_inventory
            #Werbung
            #- case 44:
        on player left clicks in Profil_auswahl_inventory slot:11|12|13|14|17|20|21|22|23|26|29|30|31|32|35|38|39|40|41|44:
        - choose <context.slot>:
          #Erste Reihe
            #Profil 1
            - case 11:
                - if <player.has_flag[Profil_1]>:
                    - flag <player> Profil:Profil_1
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_1
                    - inventory open d:Rassen_auswahl_inventory
            #Profil 2
            - case 12:
                - flag <player> Profil_creation.Profil:Profil_2
                - inventory open d:Rassen_auswahl_inventory
            #Profil 3
            - case 13:
                - flag <player> Profil_creation.Profil:Profil_3
                - inventory open d:Rassen_auswahl_inventory
            #Profil 4
            - case 14:
                - flag <player> Profil_creation.Profil:Profil_4
                - inventory open d:Rassen_auswahl_inventory
            #Settings
            #- case 17:
          #Zweite Reihe
            #Profil 6
            - case 20:
                - flag <player> Profil_creation.Profil:Profil_5
                - inventory open d:Rassen_auswahl_inventory
            #Profil 7
            - case 21:
                - flag <player> Profil_creation.Profil:Profil_6
                - inventory open d:Rassen_auswahl_inventory
            #Profil 8
            - case 22:
                - flag <player> Profil_creation.Profil:Profil_7
                - inventory open d:Rassen_auswahl_inventory
            #Profil 9
            - case 23:
                - flag <player> Profil_creation.Profil:Profil_8
                - inventory open d:Rassen_auswahl_inventory
            #Werbung
            #- case 26:
          #Dritte Reihe
            #Profil 11
            - case 29:
                - flag <player> Profil_creation.Profil:Profil_9
                - inventory open d:Rassen_auswahl_inventory
            #Profil 12
            - case 30:
                - flag <player> Profil_creation.Profil:Profil_10
                - inventory open d:Rassen_auswahl_inventory
            #Profil 13
            - case 31:
                - flag <player> Profil_creation.Profil:Profil_11
                - inventory open d:Rassen_auswahl_inventory
            #Profil 14
            - case 32:
                - flag <player> Profil_creation.Profil:Profil_12
                - inventory open d:Rassen_auswahl_inventory
            #Werbung
            #- case 35:
          #Vierte Reihe
            #Profil 16
            - case 38:
                - flag <player> Profil_creation.Profil:Profil_13
                - inventory open d:Rassen_auswahl_inventory
            #Profil 17
            - case 39:
                - flag <player> Profil_creation.Profil:Profil_14
                - inventory open d:Rassen_auswahl_inventory
            #Profil 18
            - case 40:
                - flag <player> Profil_creation.Profil:Profil_15
                - inventory open d:Rassen_auswahl_inventory
            #Profil 19
            - case 41:
                - flag <player> Profil_creation.Profil:Profil_16
                - inventory open d:Rassen_auswahl_inventory
            #Werbung
            #- case 44: