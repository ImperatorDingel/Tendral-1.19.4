##Channel:
    #System
    #Global//all
    #Support
    #Party
    #Gilde

Chat_data:
    type: data
    Player_name:
        - "<gold><bold><[rang]> <[name]>"
        - "<gold><bold>Rasse: <[rasse]>"
        - "<gold><bold>Level: <[level]>"
    Global:
        - <[Channel]>
        - <&chr[Eff9].font[economy-icons]> <gold><bold><[day]> <proc[Month_formatter].context[<[month]>]>, <[year]>
        - <reset><&chr[Eff8].font[economy-icons]> <gold><bold><[Zeit]>

Tendral_Chat:
    type: world
    events:
        on player joins:
        - if <player.has_flag[Channel]>:
            - determine cancelled
        - else:
            - flag <player> Channel
            - flag <player> Channel.System
            - flag <player> Channel.Global
            - flag <player> Channel.Support
            - flag <player> Channel.Party
            - flag <player> Channel.Gilde
        on player chats:
        - determine passively cancelled
        - if !<player.has_flag[Channel.Global]>:
            - narrate "Du bist nicht im Global Channel!"
            - determine cancelled
        - if <player.has_permission[tendral.suffix.held]>:
            - define color <gold>
            - define Suffix Held
            - define rang <[color]><[suffix]>
        - if <player.has_permission[tendral.suffix.gm]>:
            - define color <dark_red>
            - define suffix <&chr[Eff6].font[economy-icons]>
            - define rang <[suffix]><[color]>
        - define Channel Global
        - define day <util.time_now.format[dd]>
        - define month <util.time_now.format[MM]>
        - define year <util.time_now.format[yyyy]>
        - define Zeit <util.time_now.format[HH:mm:ss]>
        - define name <script[Tableiste_Data].data_key[enable_prefix_suffix].if_true[<player.chat_prefix.parse_color><player.flag[nickname].if_null[<player.name>]><player.chat_suffix.parse_color>].if_false[<player.flag[nickname].if_null[<player.name>]>]>
        - define targetCh <player.flag[Channel]>
        - define level <player.flag[<player.flag[Profil]>.Level]>
        - define rasse <player.flag[<player.flag[Profil]>.Race]>
        - foreach <server.online_players_flagged[Channel]>:
            - if <[value].has_flag[Channel.Global]>:
                - define Global:->:<[value]>
        - narrate "<&hover[<script[Chat_data].parsed_key[Global].separated_by[<&nl>]>]><&chr[1008].font[economy-icons]><&end_hover> <[Rang]> <&hover[<script[Chat_data].parsed_key[Player_name].separated_by[<&nl>]>]><[name]><&end_hover> <reset><&chr[1007].font[economy-icons]> <gold><context.message>" targets:<[global]>

Support:
    type: command
    name: Support
    description: Does something
    usage: /Support
    aliases:
    - s
    permission: dscript.mycmd
    script:
    - define message <context.raw_args>
    - if !<player.has_flag[Channel.Support]>:
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
    - define channel Support
    - define day <util.time_now.format[dd]>
    - define month <util.time_now.format[MM]>
    - define year <util.time_now.format[yyyy]>
    - define Zeit <util.time_now.format[HH:mm:ss]>
    - define name <script[Tableiste_Data].data_key[enable_prefix_suffix].if_true[<player.chat_prefix.parse_color><player.flag[nickname].if_null[<player.name>]><player.chat_suffix.parse_color>].if_false[<player.flag[nickname].if_null[<player.name>]>]>
    - define targetCh <player.flag[Channel]>
    - define level <player.flag[<player.flag[Profil]>.Level]>
    - define rasse <player.flag[<player.flag[Profil]>.Race]>
    - foreach <server.online_players_flagged[Channel]>:
        - if <[value].has_flag[Channel.Support]>:
            - define Support:->:<[value]>
    - narrate "<&hover[<script[Chat_data].parsed_key[Global].separated_by[<&nl>]>]><&chr[1009].font[economy-icons]><&end_hover> <[Rang]> <&hover[<script[Chat_data].parsed_key[Player_name].separated_by[<&nl>]>]><[name]><&end_hover> <reset><&chr[1007].font[economy-icons]> <gold><[message]>" targets:<[Support]>

