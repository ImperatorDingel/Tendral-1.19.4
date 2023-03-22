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
    
    - "Event"

    - "Bronze"
    - "Bronze"
    - "Bronze"
    - "Bronze"
    
    - "Discord"

    - "Bronze"
    - "Bronze"
    - "Bronze"
    - "Bronze"
    
    - "Website"

    ProfilInfo:
    - "<gold><bold>۞<gold> >> Charakter Info << <bold>۞"
    - "<gold><bold>۞<gold> Rasse >> <[Race]>"
    - "<gold><bold>۞<gold> Level >> <[Level]>"
    - "<gold><bold>۞<gold> Schwierigkeit >> <[Difficulty]>"
    - <empty>
    - <empty>
    - "<green>[ < auswählen] <red>[löschen > ]"
    - "erstellt vor <[time].from_now.formatted>"

    Wiederherrstellen:
    - "<gold><bold>۞<gold> Lässt dich deinen letzten Charakter wiederherstellen."
    - <empty>
    - "<gold><bold>۞<gold> <player.flag[deleted_profilslot].if_null[<gold>-<empty>]>"
    - "<gold><bold>۞<gold> <player.flag[last_deleted.Race].if_null[<gold>-<empty>]>"
    - "<gold><bold>۞<gold> <player.flag[last_deleted.Level].if_null[<gold>-<empty>]>"
    - "<gold><bold>۞<gold> <player.flag[last_deleted.Difficulty].if_null[<gold>-<empty>]>"
    - "<gold><bold>۞<gold> <green> Klicken zum wiederherstellen"




Profil_auswahl_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: <gray><bold>Profil auswahl
    debug: false
    procedural items:
    - define result <list>
    - define anzahl 0
    - foreach <script[profil_auswahl_data].parsed_key[Profilliste]>:
        #- define Slot Profil_<[loop_index]>
        - choose <[value]>:
            - case Free:
                - define anzahl:++
                - define Slot Profil_<[anzahl]>
                - if <player.has_flag[Profil_<[anzahl]>]>:
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
                    - define item player_head[display=<gold><bold>۞<&sp><green><bold><player.name><&sp>[<[Profil]>]<&sp><gold><bold>۞;Lore=<script[profil_auswahl_data].parsed_key[ProfilInfo].separated_by[<n>]>;skull_skin=<[skin]>]
                - else:
                    - define item lime_stained_glass_pane[display=<green><bold>Profil<&sp><[anzahl]>]
            - case Bronze:
                - define anzahl:++
                - define Slot Profil_<[anzahl]>
                - if <player.has_flag[Profil_<[anzahl]>]>:
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
                    - define item player_head[display=<gold><bold>۞<&sp><green><bold><player.name><&sp>[<[Profil]>]<&sp><gold><bold>۞;Lore=<script[profil_auswahl_data].parsed_key[ProfilInfo].separated_by[<n>]>;skull_skin=<[skin]>]
                - else:
                    - if <player.has_permission[tendral.bronze]>:
                        - define item lime_stained_glass_pane[display=<green><bold>Profil<&sp><[anzahl]>]
                    - else:
                        - define item red_stained_glass_pane[display=<red><bold>Profil<&sp><[anzahl]>]
            - case Settings:
                - define item yellow_stained_glass_pane[display=<yellow><bold>Charakter<&sp>Wiederherstellung;lore=<script[profil_auswahl_data].parsed_key[wiederherrstellen].separated_by[<n>]>]
            - case Event:
                - define item magenta_stained_glass_pane[display=<blue><bold>Events]
            - case Discord:
                - define item magenta_stained_glass_pane[display=<light_purple><bold>Discord]
            - case Website:
                - define item magenta_stained_glass_pane[display=<gold><bold>www.Tendralcraft.de]
        - define result <[result].include[<[item]>]>
    - determine <[result]>
    slots:
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [] [] [] [] [air] [air] [] [air]
    - [air] [] [] [] [] [air] [air] [] [air]
    - [air] [] [] [] [] [air] [air] [] [air]
    - [air] [] [] [] [] [air] [air] [] [air]
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]

Profil_auswahl_click_handler:
    type: world
    debug: false
    events:
        after delta time secondly:
        - run profil_auswahl_task
        - run nameplate_task
        on player right clicks in Profil_auswahl_inventory slot:11|12|13|14|17|20|21|22|23|26|29|30|31|32|35|38|39|40|41|44:
        - choose <context.slot>:
          #Erste Reihe
            #Profil 1
            - case 11:
                - flag <player> last_deleted:<player.flag[Profil_1]>
                - flag <player> deleted_profilslot:Profil_1
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
            - case 17:
                - if <player.has_flag[deleted_profilslot]>:
                    - flag <player> <player.flag[deleted_profilslot]>:<player.flag[last_deleted]>
                    - flag <player> deleted_profilslot:!
                    - flag <player> last_deleted:!
                - inventory open d:Profil_auswahl_inventory
          #Zweite Reihe
            #Profil 6
            - case 20:
                - flag <player> Profil_5:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 7
            - case 21:
                - flag <player> Profil_6:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 8
            - case 22:
                - flag <player> Profil_7:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 9
            - case 23:
                - flag <player> Profil_8:!
                - inventory open d:Profil_auswahl_inventory
            #Werbung
            #- case 26:
          #Dritte Reihe
            #Profil 11
            - case 29:
                - flag <player> Profil_9:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 12
            - case 30:
                - flag <player> Profil_10:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 13
            - case 31:
                - flag <player> Profil_11:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 14
            - case 32:
                - flag <player> Profil_12:!
                - inventory open d:Profil_auswahl_inventory
            #Werbung
            #- case 35:
          #Vierte Reihe
            #Profil 16
            - case 38:
                - flag <player> Profil_13:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 17
            - case 39:
                - flag <player> Profil_14:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 18
            - case 40:
                - flag <player> Profil_15:!
                - inventory open d:Profil_auswahl_inventory
            #Profil 19
            - case 41:
                - flag <player> Profil_16:!
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
                    - if <player.has_flag[<player.flag[Profil]>.Server]>:
                        - adjust <player> send_to:<player.flag[<player.flag[Profil]>.Server]>
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                    - foreach <player.flag[<player.flag[Profil]>.inventory]>:
                        - inventory set o:<[value]> slot:<[loop_index]>
                        - inventory set o:Menu_item slot:9
                        - inventory set o:Rucksack_item slot:8
                        - inventory set o:Questbuch slot:7
                - else:
                    - flag <player> Profil_creation.Profil:profil_1
                    - inventory open d:Rassen_auswahl_inventory
            #Profil 2
            - case 12:
                - if <player.has_flag[Profil_2]>:
                    - flag <player> Profil:Profil_2
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_2
                    - inventory open d:Rassen_auswahl_inventory
            #Profil 3
            - case 13:
                - if <player.has_flag[Profil_3]>:
                    - flag <player> Profil:Profil_3
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_3
                    - inventory open d:Rassen_auswahl_inventory
            #Profil 4
            - case 14:
                - if <player.has_flag[Profil_4]>:
                    - flag <player> Profil:Profil_4
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_4
                    - inventory open d:Rassen_auswahl_inventory
            #Settings
            - case 17:
                - if <player.has_flag[deleted_profilslot]>:
                    - if <player.has_flag[<player.flag[deleted_profilslot]>]>:
                        - narrate "Profil ist besetzt."
                    - else:
                        - flag <player> <player.flag[deleted_profilslot]>:<player.flag[last_deleted]>
                        - flag <player> deleted_profilslot:!
                        - flag <player> last_deleted:!
                - inventory open d:Profil_auswahl_inventory
          #Zweite Reihe
            #Profil 6
            - case 20:
                - if <player.has_flag[Profil_5]>:
                    - flag <player> Profil:Profil_5
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_5
                    - inventory open d:Rassen_auswahl_inventory
            #Profil 7
            - case 21:
                - if <player.has_flag[Profil_6]>:
                    - flag <player> Profil:Profil_6
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_6
                    - inventory open d:Rassen_auswahl_inventory
            #Profil 8
            - case 22:
                - if <player.has_flag[Profil_7]>:
                    - flag <player> Profil:Profil_7
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_7
                    - inventory open d:Rassen_auswahl_inventory
            #Profil 9
            - case 23:
                - if <player.has_flag[Profil_8]>:
                    - flag <player> Profil:Profil_8
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_8
                    - inventory open d:Rassen_auswahl_inventory
            #Werbung
            #- case 26:
          #Dritte Reihe
            #Profil 11
            - case 29:
                - if <player.has_flag[Profil_9]>:
                    - flag <player> Profil:Profil_9
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_9
                    - inventory open d:Rassen_auswahl_inventory
            #Profil 12
            - case 30:
                - if <player.has_flag[Profil_10]>:
                    - flag <player> Profil:Profil_10
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_10
                    - inventory open d:Rassen_auswahl_inventory
            #Profil 13
            - case 31:
                - if <player.has_flag[Profil_11]>:
                    - flag <player> Profil:Profil_11
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_11
                    - inventory open d:Rassen_auswahl_inventory
            #Profil 14
            - case 32:
                - if <player.has_flag[Profil_12]>:
                    - flag <player> Profil:Profil_12
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_12
                    - inventory open d:Rassen_auswahl_inventory
            #Werbung
            #- case 35:
          #Vierte Reihe
            #Profil 16
            - case 38:
                - if <player.has_flag[Profil_13]>:
                    - flag <player> Profil:Profil_13
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_13
                    - inventory open d:Rassen_auswahl_inventory
            #Profil 17
            - case 39:
                - if <player.has_flag[Profil_14]>:
                    - flag <player> Profil:Profil_14
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_14
                    - inventory open d:Rassen_auswahl_inventory
            #Profil 18
            - case 40:
                - if <player.has_flag[Profil_15]>:
                    - flag <player> Profil:Profil_15
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_15
                    - inventory open d:Rassen_auswahl_inventory
            #Profil 19
            - case 41:
                - if <player.has_flag[Profil_16]>:
                    - flag <player> Profil:Profil_16
                    - inventory close
                    - if <player.has_flag[<player.flag[Profil]>.last_location]>:
                        - teleport <player> <player.flag[<player.flag[Profil]>.last_location]>
                    - else:
                        - teleport <player> spawn
                - else:
                    - flag <player> Profil_creation.Profil:profil_16
                    - inventory open d:Rassen_auswahl_inventory
            #Werbung
            #- case 44:

Profil_auswahl_command:
    type: command
    name: Profil
    description: Ruft das Profil inventar auf
    usage: /Profil
    permission: Tendral.Profil
    debug: false
    script:
    - if <player.has_flag[nameplate]>:
            - kill <player.flag[nameplate]>
            - flag <player> nameplate:!
    - adjust <player> hide_from_players
    - teleport <player> Profil_auswahl
    - inventory open d:Profil_auswahl_inventory

Profil_auswahl_task:
    type: task
    debug: false
    script:
    - foreach <server.online_players_flagged[Profil]>:
        - if <[value].has_flag[nameplate]>:
            - determine passively cancelled
        - else:
            - adjust <[value]> show_to_players
            - spawn nameplates_armorstand <[value].location.above[300]> save:nameplate
            - define target <server.online_players.exclude[<[value]>]>
            - attach <entry[nameplate].spawned_entity> to:<[value]> for:<[target]> offset:0,1,0
            - adjust <entry[nameplate].spawned_entity> custom_name:<[value].name>
            - adjust <entry[nameplate].spawned_entity> custom_name_visible:true
            - flag <[value]> nameplate:<entry[nameplate].spawned_entity>

Nameplate_task:
    type: task
    debug: false
    script:
    - foreach <server.online_players_flagged[nameplate]>:
        - define entity <[value].flag[nameplate]>
        - define name <[value].name>
        - define Rasse <[value].flag[<[value].flag[Profil]>.Race]>
        - define Level <[value].flag[<[value].flag[Profil]>.Level]>
        - if <[value].has_permission[tendral.suffix.Neuling]>:
            - adjust <[entity]> custom_name:[<[Rasse]>]<&sp><[name]><&sp>[<[Level]>]
        - if <[value].has_permission[tendral.suffix.Spieler]>:
            - adjust <[entity]> custom_name:[<[Rasse]>]<&sp><[name]><&sp>[<[Level]>]
        - if <[value].has_permission[tendral.suffix.Held]>:
            - adjust <[entity]> custom_name:<gold>[Held]<reset>[<[Rasse]>]<&sp><[name]><&sp>[<[Level]>]
        - if <[value].has_permission[tendral.suffix.support]>:
            - adjust <[entity]> custom_name:<red>[S]<reset>[<[Rasse]>]<&sp><[name]><&sp>[<[Level]>]
        - if <[value].has_permission[tendral.suffix.DEV]>:
            - adjust <[entity]> custom_name:<red>[Dev]<reset>[<[Rasse]>]<&sp><[name]><&sp>[<[Level]>]
        - if <[value].has_permission[tendral.suffix.GM]>:
            - adjust <[entity]> custom_name:<dark_red>[GM]<reset>[<[Rasse]>]<&sp><[name]><&sp>[<[Level]>]

nameplates_armorstand:
    type: entity
    entity_type: armor_stand
    mechanisms:
        arms: false
        base_plate: false
        invulnerable: true
        is_small: true
        visible: false
        gravity: false