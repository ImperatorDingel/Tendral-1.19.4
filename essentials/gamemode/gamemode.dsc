gamemode_changer:
    type: command
    name: gamemode
    description: Does something
    usage: /gamemode
    permission: Tendral.Gamemode
    aliases:
        - gm
    tab completions:
      1: 1|2|3|4
      2: <server.online_players.parse[name]>
    script:
    - define target <server.match_offline_player[<context.args.get[2].if_null[<player>]>].if_null[<player>]>
    - choose <context.args.get[1]>:
        - case 1:
            - adjust <[target]> gamemode:survival
            - narrate targets:<[target]> "Gamemode wurde auf Survival geändert." format:AnnounceFormat
        - case 2:
            - adjust <[target]> gamemode:creative
            - narrate targets:<[target]> "Gamemode wurde auf Kreativ geändert." format:AnnounceFormat
        - case 3:
            - adjust <[target]> gamemode:adventure
            - narrate targets:<[target]> "Gamemode wurde auf Adventure geändert." format:AnnounceFormat
        - case 4:
            - adjust <[target]> gamemode:spectator
            - narrate targets:<[target]> "Gamemode wurde auf Beobachter geändert." format:AnnounceFormat
        - case survival:
            - adjust <[target]> gamemode:survival
            - narrate targets:<[target]> "Gamemode wurde auf Survival geändert." format:AnnounceFormat
        - case creative:
            - adjust <[target]> gamemode:creative
            - narrate targets:<[target]> "Gamemode wurde auf Kreativ geändert." format:AnnounceFormat
        - case adventure:
            - adjust <[target]> gamemode:adventure
            - narrate targets:<[target]> "Gamemode wurde auf Adventure geändert." format:AnnounceFormat
        - case spectator:
            - adjust <[target]> gamemode:spectator
            - narrate targets:<[target]> "Gamemode wurde auf Beobachter geändert." format:AnnounceFormat