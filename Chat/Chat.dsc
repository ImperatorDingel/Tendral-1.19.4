Tendral_Chat:
    type: world
    events:
        on player joins:
        - flag <player> Channel:Global
        on player chats:
        - determine passively cancelled
        - define targetCh <player.flag[Channel]>
        - foreach <server.online_players_flagged[Channel]>:
            - if <[value].flag[Channel]> == Global:
                - define Global:->:<[value]>
            - if <[value].flag[Channel]> == Support:
                - define Support:->:<[value]>
        - narrate "[<player.flag[Channel]>] <player.name> -> <context.message>" targets:<[<player.flag[channel]>]>