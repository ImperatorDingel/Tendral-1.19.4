player_report_data:
    type: data
    report:
    - <empty>
    - <empty>
    - <empty>
    inventory:
    - Reports:<empty>
    - Hacks: <[hacks]>
    - Toxic: <[toxic]>
    - Bug abuse: <[bug_abuse]>
    - andere: <[other]>
    log:
    - Name: <[player].name>
    - Reports:<empty>
    - Hacks: <[hacks]>
    - Toxic: <[toxic]>
    - Bug abuse: <[bug_abuse]>
    - andere: <[other]>

report:
    type: command
    name: report
    description: Does something
    usage: /report <&lt>arg<&gt>
    permission: dscript.mycmd
    tab completions:
        1: <server.players.parse[name].if_null[NULL]>
        2: Toxic|Hacks|Bug<&sp>abuse|other
    script:
    #- narrate "Hello! <context.args.get[1].as_player>"
    - if !<server.has_flag[player_reports]>:
        - flag server player_reports: []
    - if <context.args.get[2].equals[<empty>]>:
        - narrate "Bitte gib einen Reportgrund an."
        - determine cancelled
    - else:
        - define player_report Report_<server.match_offline_player[<context.args.get[1]>]>
        - if <player.has_flag[<[player_report]>]>:
            - narrate "Warte bitte bis du diesen Spieler wieder reporten kannst. <player.flag_expiration[<[player_report]>].format[mm]>"
            - determine cancelled
        - if !<server.has_flag[<[player_report]>]>:
            - definemap report:
                player: <server.match_offline_player[<context.args.get[1]>]>
                Toxic: 0
                Hacks: 0
                Bug_abuse: 0
                other: 0
            - flag server player_reports:->:<[player_report]>
            - flag server <[player_report]>:<[report]>
        - choose <context.args.get[2]>:
            - case toxic:
                - flag server <[player_report]>.Toxic:++
            - case hacks:
                - flag server <[player_report]>.Hacks:++
            - case Bug<&sp>abuse:
                - flag server <[player_report]>.bug_abuse:++
            - case other:
                - flag server <[player_report]>.other:++
        - narrate "du hast <context.args.get[1]> wegen <context.args.get[2]> gemeldet"
        - define player <server.flag[<[player_report]>.player]>
        - define hacks <server.flag[<[player_report]>.hacks]>
        - define toxic <server.flag[<[player_report]>.toxic]>
        - define bug_abuse <server.flag[<[player_report]>.bug_abuse]>
        - define other <server.flag[<[player_report]>.other]>
        - ~log <script[player_report_data].parsed_key[log].separated_by[<&nl>]> type:clear file:/report/<[player_report]>.log
        - flag <player> <[player_report]> expire:<util.time_now.add[30m]>

report_inventory:
    type: inventory
    inventory: chest
    gui: true
    procedural items:
    - define result <list>
    - foreach <server.flag[player_reports]>:
        - define player <server.flag[<[value]>.player]>
        - define hacks <server.flag[<[value]>.hacks]>
        - define toxic <server.flag[<[value]>.toxic]>
        - define bug_abuse <server.flag[<[value]>.bug_abuse]>
        - define other <server.flag[<[value]>.other]>
        - define item player_head[display=<[player].name>;lore=<script[player_report_data].parsed_key[inventory].separated_by[<&nl>]>;skull_skin=<[player].uuid>]
        - define result <[result].include[<[item]>]>
    - determine <[result]>
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []