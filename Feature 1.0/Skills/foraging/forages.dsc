forages:
    type: world
    events:
        on player breaks *_log:
        - define dropchance <player.flag[<player.flag[Profil]>.skills.foraging.Dropchance]>
        - define maxdropchance <player.flag[<player.flag[Profil]>.skills.foraging.maxDropchance]>
        - define maxdrop <player.flag[<player.flag[Profil]>.skills.foraging.maxdrop]>
        - define chance <util.random.int[<[dropchance]>].to[<[maxdropchance]>]>
        - define drop <util.random.int[1].to[3]>
        - define basexp 10
        - if <context.material.name> == oak_log:
            - if <player.item_in_hand> == <item[flint_axe]>:
                - if <player.flag[<player.flag[Profil]>.skills.foraging.Level]> < 5:
                    - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp]>
                    - determine <item[oak_log_1]>
                - if <player.flag[<player.flag[Profil]>.skills.foraging.Level]> >= 5:
                    - if <[chance]> < 25:
                        - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp]>
                        - determine <item[oak_log_1]>
                    - if <[chance]> < 50:
                        - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp].add[2]>
                        - determine <item[oak_log_2]>
                    - if <[chance]> < 75:
                        - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp].add[4]>
                        - determine <item[oak_log_3]>
                    - if <[chance]> < 100:
                        - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp].add[6]>
                        - determine <item[oak_log_4]>
            - else:
                - flag player <player.flag[Profil]>.skills.foraging.Exp:+:<[basexp]>
                - determine <item[oak_log_1]>
        on player right clicks grass_block with:air:
        - drop <item[flint]> <context.location>
