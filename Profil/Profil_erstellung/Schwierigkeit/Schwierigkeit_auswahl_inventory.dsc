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
                - definemap Profil_Flag_set:
                    creation_time: <time[<util.time_now>]>
                    Level: 1
                    Difficulty: <player.flag[profil_creation.Schwierigkeit]>
                    Rucksack: <player.flag[Profil_creation.Profil]>_<player.uuid>_Backpack
                    Race: <player.flag[profil_creation.Rasse]>
                    Klasse: Novize
                    EXP:
                        Exp: 0
                        Target: 100
                        Gesamt: 0
                    Economy:
                        Money: 0
                        Bank: 0
                    Stats:
                        Leben: 10
                        Dmg: 2
                        Def: 0
                        Mana: 0
                        ManaMax: 10
                        Stamina: 0
                        StaminaMax: 100
                        Speed: 100
                    Skills:
                        Combat:
                            Level: 0
                            Exp: 0
                            Target: 100
                            Prozent: 0
                            MaxDrop: 1
                        Mining:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                        Foraging:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                        Farming:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                        Fishing:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                    Professions:
                        Blacksmith:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                        Weaponsmith:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                        Armorer:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                        Cook:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                    ExpBar:
                        Level: <white>--------------------
                        Combat: <white>--------------------
                        Mining: <white>--------------------
                        Foraging: <white>--------------------
                        Farming: <white>--------------------
                        Fishing: <white>--------------------
                        Blacksmith: <white>--------------------
                        Weaponsmith: <white>--------------------
                        Armorer: <white>--------------------
                        Cook: <white>--------------------
                    ExpProzent:
                    NPC:
                    Main-Quests:
                    Side-Quests:
                    Daily-Quests:
                - flag <player> <player.flag[Profil_creation.Profil]>:<[Profil_flag_set]>
                - flag <player> profil_creation:!
                - inventory open d:Profil_auswahl_inventory
            - case 6:
                - flag <player> profil_creation.Schwierigkeit:Hardcore
                - definemap Profil_Flag_set:
                    creation_time: <time[<util.time_now>]>
                    Level: 1
                    Difficulty: <player.flag[profil_creation.Schwierigkeit]>
                    Rucksack: <player.flag[Profil_creation.Profil]>_<player.uuid>_Backpack
                    Race: <player.flag[profil_creation.Rasse]>
                    Klasse: Novize
                    EXP:
                        Exp: 0
                        Target: 100
                        Gesamt: 0
                    Economy:
                        Money: 0
                        Bank: 0
                    Stats:
                        Leben: 10
                        Dmg: 2
                        Def: 0
                        Mana: 0
                        ManaMax: 10
                        Stamina: 0
                        StaminaMax: 100
                        Speed: 100
                    Skills:
                        Combat:
                            Level: 0
                            Exp: 0
                            Target: 100
                            Prozent: 0
                            MaxDrop: 1
                        Mining:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                        Foraging:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                        Farming:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                        Fishing:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                    Professions:
                        Blacksmith:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                        Weaponsmith:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                        Armorer:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                        Cook:
                            Level: 0
                            Exp: 0
                            Target: 100
                            MaxDrop: 1
                    ExpBar:
                        Level: <white>--------------------
                        Combat: <white>--------------------
                        Mining: <white>--------------------
                        Foraging: <white>--------------------
                        Farming: <white>--------------------
                        Fishing: <white>--------------------
                        Blacksmith: <white>--------------------
                        Weaponsmith: <white>--------------------
                        Armorer: <white>--------------------
                        Cook: <white>--------------------
                    ExpProzent:
                    NPC:
                    Main-Quests:
                    Side-Quests:
                    Daily-Quests:
                - flag <player> <player.flag[Profil_creation.Profil]>:<[Profil_flag_set]>
                - flag <player> profil_creation:!
                - inventory open d:Profil_auswahl_inventory
