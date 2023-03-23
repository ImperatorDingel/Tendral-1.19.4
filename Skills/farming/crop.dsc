CropFarm:
    type: world
    debug: false
    events:
        #Farm Skill on level 5 right clicking crops
        after player right clicks block:
        - if <player.flag[<player.flag[Profil]>.Skills.Farming.Level]> >= 5:
            - if <context.location.material.age> == <context.location.material.maximum_age>:
                - choose <context.location.material.name>:
                    - case potatoes:
                        - define drop <util.random.int[1].to[4]>
                        - define name Potato
                        - define list <list>
                        - define xpliste 0
                        - repeat <[drop]>:
                        # level berechnung
                            - define lvl <util.random.int[1].to[<player.flag[<player.flag[Profil]>.Skills.Farming.Level]>]>
                        # Größen berechnung
                            - define cropsize <[lvl].mul[2]>
                        # chancen berechnung
                            - define chance <util.random.int[1].to[100]>
                            - if <[chance]> < 50:
                                - define rare <empty>
                            - if <[chance]> >= 50:
                                - define rare <gold><bold>[<gold>★<bold>]<&sp>
                                - define cropsize <[cropsize].add[5]>
                            - if <[chance]> >= 75:
                                - define rare <gold><bold>[<gray>★★<gold><bold>]<&sp>
                                - define cropsize <[cropsize].add[10]>
                            - if <[chance]> >= 95:
                                - define rare <gold><bold>[<yellow>★★★<gold><bold>]<&sp>
                                - define cropsize <[cropsize].add[15]>
                        # Xp berechnung
                            - define xp <[lvl].add[<[cropsize]>].mul[2]>
                        # Gewicht berechnung
                            - define weight <[cropsize].mul[30]>
                        # Preis berechnung Gewicht * 1
                            - define prize <[weight].mul[1]>
                        # map
                            - definemap Info:
                                display_name: "<gold><bold>۞ <[name]> <[rare]><gold><bold>۞"
                                lore:
                                - "<gold><bold>۞ Größe: <proc[metric_number3].context[<[cropsize]>]> "
                                - "<gold><bold>۞ Gewicht: <proc[metric_number2].context[<[weight]>]> "
                                - "<gold><bold>۞"
                                - "<gold><bold>۞ Preis:"
                                - "<gold><bold>۞ <[prize].proc[Economy_Tendral_proc2]>"
                            - define item <item[potato].with_map[<[Info]>].with_flag[Preis:<[prize]>]>
                            - define list <[list].include[<[item]>]>
                            - define xpliste:+:<[xp]>
                        - toast "Farming +<[xpliste]> Exp" icon:iron_hoe targets:<player>
                        - flag <player> <player.flag[Profil]>.Skills.Farming.Exp:+:<[xpliste]>
                        - adjustblock <context.location> age:0
                        - drop <[list]> <context.location>
                    - case carrots:
                        - define drop <util.random.int[1].to[4]>
                        - define name carrot
                        - define list <list>
                        - define xpliste 0
                        - repeat <[drop]>:
                        # level berechnung
                            - define lvl <util.random.int[1].to[<player.flag[<player.flag[Profil]>.Skills.Farming.Level]>]>
                        # Größen berechnung
                            - define cropsize <[lvl].mul[2]>
                        # chancen berechnung
                            - define chance <util.random.int[1].to[100]>
                            - if <[chance]> < 50:
                                - define rare <empty>
                            - if <[chance]> >= 50:
                                - define rare <gold><bold>[<gold>★<bold>]<&sp>
                                - define cropsize <[cropsize].add[5]>
                            - if <[chance]> >= 75:
                                - define rare <gold><bold>[<gray>★★<gold><bold>]<&sp>
                                - define cropsize <[cropsize].add[10]>
                            - if <[chance]> >= 95:
                                - define rare <gold><bold>[<yellow>★★★<gold><bold>]<&sp>
                                - define cropsize <[cropsize].add[15]>
                        # Xp berechnung
                            - define xp <[lvl].add[<[cropsize]>].mul[2]>
                        # Gewicht berechnung
                            - define weight <[cropsize].mul[30]>
                        # Preis berechnung Gewicht * 1
                            - define prize <[weight].mul[1]>
                        # map
                            - definemap Info:
                                display_name: "<gold><bold>۞ <[name]> <[rare]><gold><bold>۞"
                                lore:
                                - "<gold><bold>۞ Größe: <proc[metric_number3].context[<[cropsize]>]> "
                                - "<gold><bold>۞ Gewicht: <proc[metric_number2].context[<[weight]>]> "
                                - "<gold><bold>۞"
                                - "<gold><bold>۞ Preis:"
                                - "<gold><bold>۞ <[prize].proc[Economy_Tendral_proc2]>"
                            - define item <item[carrot].with_map[<[Info]>].with_flag[Preis:<[prize]>]>
                            - define list <[list].include[<[item]>]>
                            - define xpliste:+:<[xp]>
                        - toast "Farming +<[xpliste]> Exp" icon:iron_hoe targets:<player>
                        - flag <player> <player.flag[Profil]>.Skills.Farming.Exp:+:<[xpliste]>
                        - adjustblock <context.location> age:0
                        - drop <[list]> <context.location>
                    - case wheat:
                        - define drop <util.random.int[1].to[4]>
                        - define name Wheat
                        - define list <list>
                        - define xpliste 0
                        - repeat <[drop]>:
                        # level berechnung
                            - define lvl <util.random.int[1].to[<player.flag[<player.flag[Profil]>.Skills.Farming.Level]>]>
                        # Größen berechnung
                            - define cropsize <[lvl].mul[2]>
                        # chancen berechnung
                            - define chance <util.random.int[1].to[100]>
                            - if <[chance]> < 50:
                                - define rare <empty>
                            - if <[chance]> >= 50:
                                - define rare <gold><bold>[<gold>★<bold>]<&sp>
                                - define cropsize <[cropsize].add[5]>
                            - if <[chance]> >= 75:
                                - define rare <gold><bold>[<gray>★★<gold><bold>]<&sp>
                                - define cropsize <[cropsize].add[10]>
                            - if <[chance]> >= 95:
                                - define rare <gold><bold>[<yellow>★★★<gold><bold>]<&sp>
                                - define cropsize <[cropsize].add[15]>
                        # Xp berechnung
                            - define xp <[lvl].add[<[cropsize]>].mul[2]>
                        # Gewicht berechnung
                            - define weight <[cropsize].mul[30]>
                        # Preis berechnung Gewicht * 1
                            - define prize <[weight].mul[1]>
                        # map
                            - definemap Info:
                                display_name: "<gold><bold>۞ <[name]> <[rare]><gold><bold>۞"
                                lore:
                                - "<gold><bold>۞ Größe: <proc[metric_number3].context[<[cropsize]>]> "
                                - "<gold><bold>۞ Gewicht: <proc[metric_number2].context[<[weight]>]> "
                                - "<gold><bold>۞"
                                - "<gold><bold>۞ Preis:"
                                - "<gold><bold>۞ <[prize].proc[Economy_Tendral_proc2]>"
                            - define item <item[wheat].with_map[<[Info]>].with_flag[Preis:<[prize]>]>
                            - define list <[list].include[<[item]>]>
                            - define xpliste:+:<[xp]>
                        - toast "Farming +<[xpliste]> Exp" icon:iron_hoe targets:<player>
                        - flag <player> <player.flag[Profil]>.Skills.Farming.Exp:+:<[xpliste]>
                        - adjustblock <context.location> age:0
                        - drop <[list]> <context.location>
                    - case beetroots:
                        - define drop <util.random.int[1].to[4]>
                        - define name Beetroot
                        - define list <list>
                        - define xpliste 0
                        - repeat <[drop]>:
                        # level berechnung
                            - define lvl <util.random.int[1].to[<player.flag[<player.flag[Profil]>.Skills.Farming.Level]>]>
                        # Größen berechnung
                            - define cropsize <[lvl].mul[2]>
                        # chancen berechnung
                            - define chance <util.random.int[1].to[100]>
                            - if <[chance]> < 50:
                                - define rare <empty>
                            - if <[chance]> >= 50:
                                - define rare <gold><bold>[<gold>★<bold>]<&sp>
                                - define cropsize <[cropsize].add[5]>
                            - if <[chance]> >= 75:
                                - define rare <gold><bold>[<gray>★★<gold><bold>]<&sp>
                                - define cropsize <[cropsize].add[10]>
                            - if <[chance]> >= 95:
                                - define rare <gold><bold>[<yellow>★★★<gold><bold>]<&sp>
                                - define cropsize <[cropsize].add[15]>
                        # Xp berechnung
                            - define xp <[lvl].add[<[cropsize]>].mul[2]>
                        # Gewicht berechnung
                            - define weight <[cropsize].mul[30]>
                        # Preis berechnung Gewicht * 1
                            - define prize <[weight].mul[1]>
                        # map
                            - definemap Info:
                                display_name: "<gold><bold>۞ <[name]> <[rare]><gold><bold>۞"
                                lore:
                                - "<gold><bold>۞ Größe: <proc[metric_number3].context[<[cropsize]>]> "
                                - "<gold><bold>۞ Gewicht: <proc[metric_number2].context[<[weight]>]> "
                                - "<gold><bold>۞"
                                - "<gold><bold>۞ Preis:"
                                - "<gold><bold>۞ <[prize].proc[Economy_Tendral_proc2]>"
                            - define item <item[beetroot].with_map[<[Info]>].with_flag[Preis:<[prize]>]>
                            - define list <[list].include[<[item]>]>
                            - define xpliste:+:<[xp]>
                        - toast "Farming +<[xpliste]> Exp" icon:iron_hoe targets:<player>
                        - flag <player> <player.flag[Profil]>.Skills.Farming.Exp:+:<[xpliste]>
                        - adjustblock <context.location> age:0
                        - drop <[list]> <context.location>
                    - case cocoa:
                        - define drop <util.random.int[1].to[4]>
                        - define name Cocoa
                        - define list <list>
                        - define xpliste 0
                        - repeat <[drop]>:
                        # level berechnung
                            - define lvl <util.random.int[1].to[<player.flag[<player.flag[Profil]>.Skills.Farming.Level]>]>
                        # Größen berechnung
                            - define cropsize <[lvl].mul[2]>
                        # chancen berechnung
                            - define chance <util.random.int[1].to[100]>
                            - if <[chance]> < 50:
                                - define rare <empty>
                            - if <[chance]> >= 50:
                                - define rare <gold><bold>[<gold>★<bold>]<&sp>
                                - define cropsize <[cropsize].add[5]>
                            - if <[chance]> >= 75:
                                - define rare <gold><bold>[<gray>★★<gold><bold>]<&sp>
                                - define cropsize <[cropsize].add[10]>
                            - if <[chance]> >= 95:
                                - define rare <gold><bold>[<yellow>★★★<gold><bold>]<&sp>
                                - define cropsize <[cropsize].add[15]>
                        # Xp berechnung
                            - define xp <[lvl].add[<[cropsize]>].mul[2]>
                        # Gewicht berechnung
                            - define weight <[cropsize].mul[30]>
                        # Preis berechnung Gewicht * 1
                            - define prize <[weight].mul[1]>
                        # map
                            - definemap Info:
                                display_name: "<gold><bold>۞ <[name]> <[rare]><gold><bold>۞"
                                lore:
                                - "<gold><bold>۞ Größe: <proc[metric_number3].context[<[cropsize]>]> "
                                - "<gold><bold>۞ Gewicht: <proc[metric_number2].context[<[weight]>]> "
                                - "<gold><bold>۞"
                                - "<gold><bold>۞ Preis:"
                                - "<gold><bold>۞ <[prize].proc[Economy_Tendral_proc2]>"
                            - define item <item[cocoa_beans].with_map[<[Info]>].with_flag[Preis:<[prize]>]>
                            - define list <[list].include[<[item]>]>
                            - define xpliste:+:<[xp]>
                        - toast "Farming +<[xpliste]> Exp" icon:iron_hoe targets:<player>
                        - flag <player> <player.flag[Profil]>.Skills.Farming.Exp:+:<[xpliste]>
                        - adjustblock <context.location> age:0
                        - drop <[list]> <context.location>
        # Player zerstört Block
        on player breaks block:
        # Crop hat maximale größe
        - if <context.location.material.age> == <context.location.material.maximum_age>:
                - choose <context.location.material.name>:
                    - case potatoes:
                        - define drop <util.random.int[1].to[<player.flag[<player.flag[Profil]>.Skills.Farming.MaxDrop]>]>
                        - drop <item[potato]> <context.location> quantity:<[drop]>
                        - run EXPCROP_Wheat
                    - case carrots:
                        - define drop <util.random.int[1].to[<player.flag[<player.flag[Profil]>.Skills.Farming.MaxDrop]>]>
                        - drop <item[carrot]> <context.location> quantity:<[drop]>
                        - run EXPCROP_Wheat
                    - case wheat:
                        - define drop <util.random.int[1].to[<player.flag[<player.flag[Profil]>.Skills.Farming.MaxDrop]>]>
                        - drop <item[wheat]> <context.location> quantity:<[drop]>
                        - run EXPCROP_Wheat
                    - case beetroots:
                        - define drop <util.random.int[1].to[<player.flag[<player.flag[Profil]>.Skills.Farming.MaxDrop]>]>
                        - drop <item[beetroot]> <context.location> quantity:<[drop]>
                        - run EXPCROP_Wheat
                    - case cocoa:
                        - define drop <util.random.int[1].to[<player.flag[<player.flag[Profil]>.Skills.Farming.MaxDrop]>]>
                        - drop <item[cocoa_beans]> <context.location> quantity:<[drop]>
                        - run EXPCROP_Wheat
        # Crop hat nicht die maximale größe
        - else:
            - choose <context.location.material.name>:
                - case melon:
                #<util.random.int[1].to[<player.flag[Profil.Skills.Farming.MaxDrop]>]>
                    - define drop 1
                    - define name Melon
                    - define list <list>
                    - define xpliste 0
                    - repeat <[drop]>:
                        # level berechnung
                        - define lvl <util.random.int[1].to[<player.flag[<player.flag[Profil]>.Skills.Farming.Level].add[2]>]>
                        # Größen berechnung
                        - define cropsize <[lvl].mul[2]>
                        # chancen berechnung
                        - define chance <util.random.int[1].to[100]>
                        - if <[chance]> < 50:
                            - define rare <empty>
                        - if <[chance]> >= 50:
                            - define rare <gold><bold>[<gold>★<bold>]<&sp>
                            - define cropsize <[cropsize].add[5]>
                        - if <[chance]> >= 75:
                            - define rare <gold><bold>[<gray>★★<gold><bold>]<&sp>
                            - define cropsize <[cropsize].add[10]>
                        - if <[chance]> >= 95:
                            - define rare <gold><bold>[<yellow>★★★<gold><bold>]<&sp>
                            - define cropsize <[cropsize].add[15]>
                        # Xp berechnung
                        - define xp <[lvl].add[<[cropsize]>].mul[2]>
                        # Gewicht berechnung
                        - define weight <[cropsize].mul[30]>
                        # Preis berechnung Gewicht * 1
                        - define prize <[weight].mul[1]>
                        # map
                        - definemap Info:
                            display_name: "<gold><bold>۞ <[name]> <[rare]><gold><bold>۞"
                            lore:
                            - "<gold><bold>۞ Größe: <proc[metric_number3].context[<[cropsize]>]> "
                            - "<gold><bold>۞ Gewicht: <proc[metric_number2].context[<[weight]>]> "
                            - "<gold><bold>۞"
                            - "<gold><bold>۞ Preis:"
                            - "<gold><bold>۞ <[prize].proc[Economy_Tendral_proc2]>"
                        - define item <item[melon].with_map[<[Info]>].with_flag[Preis:<[prize]>]>
                        - define list <[list].include[<[item]>]>
                        - define xpliste:+:<[xp]>
                    - toast "Farming +<[xpliste]> Exp" icon:iron_hoe targets:<player>
                    - flag <player> <player.flag[Profil]>.Skills.Farming.Exp:+:<[xpliste]>
                    - determine <[list]>
                - case pumpkin:
                    - define drop 1
                    - define name Pumpkin
                    - define list <list>
                    - define xpliste 0
                    - repeat <[drop]>:
                        # level berechnung
                        - define lvl <util.random.int[1].to[<player.flag[<player.flag[Profil]>.Skills.Farming.Level].add[2]>]>
                        # Größen berechnung
                        - define cropsize <[lvl].mul[2]>
                        # chancen berechnung
                        - define chance <util.random.int[1].to[100]>
                        - if <[chance]> < 50:
                            - define rare <empty>
                        - if <[chance]> >= 50:
                            - define rare <gold><bold>[<gold>★<bold>]<&sp>
                            - define cropsize <[cropsize].add[5]>
                        - if <[chance]> >= 75:
                            - define rare <gold><bold>[<gray>★★<gold><bold>]<&sp>
                            - define cropsize <[cropsize].add[10]>
                        - if <[chance]> >= 95:
                            - define rare <gold><bold>[<yellow>★★★<gold><bold>]<&sp>
                            - define cropsize <[cropsize].add[15]>
                        # Xp berechnung
                        - define xp <[lvl].add[<[cropsize]>].mul[2]>
                        # Gewicht berechnung
                        - define weight <[cropsize].mul[30]>
                        # Preis berechnung Gewicht * 1
                        - define prize <[weight].mul[1]>
                        # map
                        - definemap Info:
                            display_name: "<gold><bold>۞ <[name]> <[rare]><gold><bold>۞"
                            lore:
                            - "<gold><bold>۞ Größe: <proc[metric_number3].context[<[cropsize]>]> "
                            - "<gold><bold>۞ Gewicht: <proc[metric_number2].context[<[weight]>]> "
                            - "<gold><bold>۞"
                            - "<gold><bold>۞ Preis:"
                            - "<gold><bold>۞ <[prize].proc[Economy_Tendral_proc2]>"
                        - define item <item[pumpkin].with_map[<[Info]>].with_flag[Preis:<[prize]>]>
                        - define list <[list].include[<[item]>]>
                        - define xpliste:+:<[xp]>
                    - toast "Farming +<[xpliste]> Exp" icon:iron_hoe targets:<player>
                    - flag <player> <player.flag[Profil]>.Skills.Farming.Exp:+:<[xpliste]>
                    - determine <[list]>
                - case potatoes:
                    - drop <item[potato]> <context.location> quantity:1
                - case carrots:
                    - drop <item[carrot]> <context.location> quantity:1
                - case wheat:
                    - drop <item[wheat_seeds]> <context.location> quantity:1
                - case beetroots:
                    - drop <item[beetroot_seeds]> <context.location> quantity:1
                - case cocoa:
                    - drop <item[cocoa_beans]> <context.location> quantity:1
EXPCROP_Wheat:
    type: task
    script:
    - flag <player> <player.flag[Profil]>.Skills.Farming.Exp:+:10
    - actionbar "Farming: +10 Exp <player.flag[<player.flag[Profil]>.Skills.Farming.Exp]>/<player.flag[<player.flag[Profil]>.Skills.Farming.Target]>"
