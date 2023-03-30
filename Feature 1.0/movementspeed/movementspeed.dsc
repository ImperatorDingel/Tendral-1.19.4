movementspeed:
    type: world
    debug: false
    events:
        on player walks:
        - if <player.has_flag[profil]>:
            - define speed <player.flag[<player.flag[Profil]>.Stats.Speed]>
            - define totalspeed <[speed].div[1000]>
            - adjust <player> speed:<[totalspeed]>
