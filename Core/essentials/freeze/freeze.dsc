freeze:
    type: world
    debug: false
    events:
        on player walks:
        - if <player.has_flag[freeze]>:
            - wait 1t
            - teleport <player> <context.old_location>
            - determine cancelled
