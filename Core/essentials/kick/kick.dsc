kick_command:
    type: command
    name: yeeet
    description: Does something
    usage: /yeeet
    permission: Tendral.Kick
    tab completions:
        1: <server.online_players.parse[name]>
    script:
    - define Context <context.args.get[2].to[200].if_null[null]>
    - define target <server.match_offline_player[<context.args.get[1]>].if_null[null]>
    - define sender <script[Tableiste_Data].data_key[enable_prefix_suffix].if_true[<player.chat_prefix.parse_color><player.flag[nickname].if_null[<player.name>]><player.chat_suffix.parse_color>].if_false[<player.flag[nickname].if_null[<player.name>]>]>
    - if <[target]> == Null:
        - narrate format:AnnounceFormat "Gib bitte einen Spielernamen an."
    - else:
        - if <[context]> == null:
            - define text "Kicked by Admin"
            - kick <[target]> "reason:kicked by <[sender]>"
        - else:
            - define text <[Context]>
            - kick <[target]> "reason:<[Text]> kicked by <[sender]>"