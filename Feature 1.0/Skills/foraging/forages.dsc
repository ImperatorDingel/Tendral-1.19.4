ForagesFarm:
    type: world
    events:
        on player breaks oak_log with:air:
        - if <context.location.world> == <world[Lobby]>:
            - define xp 10
            - flag <player> <player.flag[Profil]>.Skills.Foraging.Exp:+:<[xp]>
            - toast "Foraging +<[xp]> Exp" icon:iron_axe targets:<player>
            - determine <item[oak_log_1]>
        - else:
            - determine <item[oak_log_1]>
        on player breaks spruce_log with:air:
        - if <context.location.world> == <world[Lobby]>:
            - define xp 10
            - flag <player> <player.flag[Profil]>.Skills.Foraging.Exp:+:<[xp]>
            - toast "Foraging +<[xp]> Exp" icon:iron_axe targets:<player>
            - determine <item[spruce_log_1]>
        - else:
            - determine <item[spruce_log_1]>
        on player breaks birch_log with:air:
        - if <context.location.world> == <world[Lobby]>:
            - define xp 10
            - flag <player> <player.flag[Profil]>.Skills.Foraging.Exp:+:<[xp]>
            - toast "Foraging +<[xp]> Exp" icon:iron_axe targets:<player>
            - determine <item[birch_log_1]>
        - else:
            - determine <item[birch_log_1]>
        on player breaks jungle_log with:air:
        - if <context.location.world> == <world[Lobby]>:
            - define xp 10
            - flag <player> <player.flag[Profil]>.Skills.Foraging.Exp:+:<[xp]>
            - toast "Foraging +<[xp]> Exp" icon:iron_axe targets:<player>
            - determine <item[jungle_log_1]>
        - else:
            - determine <item[jungle_log_1]>
        on player breaks acacia_log with:air:
        - if <context.location.world> == <world[Lobby]>:
            - define xp 10
            - flag <player> <player.flag[Profil]>.Skills.Foraging.Exp:+:<[xp]>
            - toast "Foraging +<[xp]> Exp" icon:iron_axe targets:<player>
            - determine <item[acacia_log_1]>
        - else:
            - determine <item[acacia_log_1]>
        on player breaks dark_oak_log with:air:
        - if <context.location.world> == <world[Lobby]>:
            - define xp 10
            - flag <player> <player.flag[Profil]>.Skills.Foraging.Exp:+:<[xp]>
            - toast "Foraging +<[xp]> Exp" icon:iron_axe targets:<player>
            - determine <item[dark_oak_log_1]>
        - else:
            - determine <item[dark_oak_log_1]>
        on player breaks mangrove_log with:air:
        - if <context.location.world> == <world[Lobby]>:
            - define xp 10
            - flag <player> <player.flag[Profil]>.Skills.Foraging.Exp:+:<[xp]>
            - toast "Foraging +<[xp]> Exp" icon:iron_axe targets:<player>
            - determine <item[mangrove_log_1]>
        - else:
            - determine <item[mangrove_log_1]>
        on player breaks oak_log with:*_axe:
        - if <context.location.world> == <world[Lobby]>:
            - define xp 10
            - define dropchance <util.random.int[1].to[<player.flag[<player.flag[profil]>.Skills.Foraging.MaxDrop]>]>
            - if <[dropchance]> <= 5:
                - define item <item[oak_log_1]>
            - if <[dropchance]> > 10:
                - define item <item[oak_log_2]>
            - if <[dropchance]> > 15:
                - define item <item[oak_log_3]>
            - if <[dropchance]> > 20:
                - define item <item[oak_log_4]>
            - flag <player> <player.flag[Profil]>.Skills.Foraging.Exp:+:<[xp]>
            - toast "Foraging +<[xp]> Exp" icon:iron_axe targets:<player>
            - determine <[item]>
        - else:
            - determine <item[oak_log_1]>
