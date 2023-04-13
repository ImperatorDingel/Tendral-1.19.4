Staffchat:
    type: command
    name: staffchat
    description: Does something
    usage: /staffchat <&lt>arg<&gt>
    permission: dscript.mycmd
    tab completions:
        1: on|off
    script:
    - choose <context.args.get[1]>:
        - case on:
            - flag <player> Channel.staffchat
            - narrate "Staffchat enabled."
        - case off:
            - flag <player> Channel.staffchat:!
            - narrate "Staffchat disabled."

staffchat_chat:
    type: command
    name: sc
    description: Does something
    usage: /sc <&lt>arg<&gt>
    permission: dscript.mycmd
    script:
    - define message <context.raw_args>
    - if !<player.has_flag[Channel.staffchat]>:
        - narrate "Du bist nicht im Support Channel!"
        - determine cancelled
    - if <player.has_permission[tendral.suffix.held]>:
        - define color <gold>
        - define Suffix Held
        - define rang <[color]><[suffix]>
    - if <player.has_permission[tendral.suffix.gm]>:
        - define color <dark_red>
        - define suffix <&chr[Eff6].font[economy-icons]>
        - define rang <[suffix]><[color]>
    - define channel Staffchat
    - define day <util.time_now.format[dd]>
    - define month <util.time_now.format[MM]>
    - define year <util.time_now.format[yyyy]>
    - define Zeit <util.time_now.format[HH:mm:ss]>
    - define name <script[Tableiste_Data].data_key[enable_prefix_suffix].if_true[<player.chat_prefix.parse_color><player.flag[nickname].if_null[<player.name>]><player.chat_suffix.parse_color>].if_false[<player.flag[nickname].if_null[<player.name>]>]>
    - define targetCh <player.flag[Channel]>
    - define level <player.flag[<player.flag[Profil]>.Level]>
    - define rasse <player.flag[<player.flag[Profil]>.Race]>
    - foreach <server.online_players_flagged[Channel]>:
        - if <[value].has_flag[Channel.staffchat]>:
            - define Staffchat:->:<[value]>
    - narrate "<&hover[<script[Chat_data].parsed_key[Global].separated_by[<&nl>]>]><&chr[1009].font[economy-icons]><&end_hover> <[Rang]> <&hover[<script[Chat_data].parsed_key[Player_name].separated_by[<&nl>]>]><[name]><&end_hover> <reset><&chr[1007].font[economy-icons]> <gold><[message]>" targets:<[Staffchat]>