muteCommand:
    type: command
    name: mute
    description: Does something
    usage: /mute
    permission: Tendral.mute
    tab completions:
        1: <server.online_players.parse[name]>
        2: 5m|15m|30m|1h|4h|24h|
    script:
    - define target <server.match_offline_player[<context.args.get[1]>].if_null[null]>
    - define time <context.args.get[2].if_null[]>
    - define sender <script[Tableiste_Data].data_key[enable_prefix_suffix].if_true[<player.chat_prefix.parse_color><player.flag[nickname].if_null[<player.name>]><player.chat_suffix.parse_color>].if_false[<player.flag[nickname].if_null[<player.name>]>]>
    - flag <[target]> Mute expire:<[time]>
    - define Zeit <[target].flag_expiration[Mute].format[dd.MM.yyyy/HH.mm.ss].if_null[immer]>
    - narrate "Du wurdest gemutet bis <[Zeit]> von <[sender]>" targets:<[target]> format:AnnounceFormat

unmuteCommand:
    type: command
    name: unmute
    description: Does something
    usage: /unmute
    permission: Tendral.unmute
    tab completions:
        1: <server.online_players.parse[name]>
    script:
    - define target <server.match_offline_player[<context.args.get[1]>].if_null[null]>
    - define sender <script[Tableiste_Data].data_key[enable_prefix_suffix].if_true[<player.chat_prefix.parse_color><player.flag[nickname].if_null[<player.name>]><player.chat_suffix.parse_color>].if_false[<player.flag[nickname].if_null[<player.name>]>]>
    - if <[target].has_flag[Mute]>:
        - flag <[target]> Mute:!
        - narrate "Du wurdest entmutet von <[sender]>" format:AnnounceFormat
    - else:
        - narrate "Spieler ist nicht gemutet." format:AnnounceFormat