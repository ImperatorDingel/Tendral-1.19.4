forages:
    type: world
    events:
        on player breaks *_log:
        - define dropchance <player.flag[<player.flag[Profil]>.skills.foraging.Dropchance]>
        - define maxdropchance <player.flag[<player.flag[Profil]>.skills.foraging.maxDropchance]>
        - define maxdrop <player.flag[<player.flag[Profil]>.skills.foraging.maxdrop]>
        - define chance <util.random.int[<[dropchance]>].to[<[maxdropchance]>]>
        - define drop <util.random.int[1].to[3]>
        - define basexp 2
        - define blockname <context.material.name>
        - if <player.item_in_hand> == <item[flint_axe]>:
            - if <player.flag[<player.flag[Profil]>.skills.foraging.Level]> < 5:
                - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp]>
                - determine <[blockname]>_1
            - if <player.flag[<player.flag[Profil]>.skills.foraging.Level]> >= 5:
                - if <[chance]> < 25:
                    - if <util.random_boolean>:
                        - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp]>
                        - determine <[blockname]>_1[quantity=<[drop]>]
                    - else:
                        - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp]>
                        - determine <[blockname]>_1
                - if <[chance]> < 50:
                    - if <util.random_boolean>:
                        - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp].add[2]>
                        - determine <[blockname]>_2[quantity=<[drop]>]
                    - else:
                        - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp].add[2]>
                        - determine <[blockname]>_2
                - if <[chance]> < 75:
                    - if <util.random_boolean>:
                        - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp].add[2]>
                        - determine <[blockname]>_3[quantity=<[drop]>]
                    - else:
                        - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp].add[2]>
                        - determine <[blockname]>_3
                - if <[chance]> < 100:
                    - if <util.random_boolean>:
                        - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp].add[2]>
                        - determine <[blockname]>_4[quantity=<[drop]>]
                    - else:
                        - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp].add[2]>
                        - determine <[blockname]>_4
        - else:
            - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp]>
            - determine <[blockname]>_1
        on player right clicks grass_block with:air:
        - drop <item[flint]> <context.location>
