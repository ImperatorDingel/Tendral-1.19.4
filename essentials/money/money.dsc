Money_:
    type: command
    name: Money
    description: Does something
    usage: /money
    tab completions:
        1: set
        2: <server.online_players.parse[name]>
        3: number
    script:
    - choose <context.args.get[1].if_null[balance]>:
        - case balance:
            - narrate "Du hast <server.economy.format[<player.flag[Profil.Economy.Money]>]> Münzen."
        - case set:
          - if <player.has_permission[Tendral.money.set]>:
            - define target <server.match_offline_player[<context.args.get[2]>].if_null[null]>
            - define zahl <context.args.get[3]>
            - if <[zahl]> >= 0:
                - flag <[target]> Profil.Economy.Money:<[zahl]>
                - narrate "Geld wurde auf <server.economy.format[<[target].money>]> für <[target].name> gesetzt"