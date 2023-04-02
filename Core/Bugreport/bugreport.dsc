Bugdata:
    type: data
    report:
    - <&chr[1009].font[economy-icons]><gold><bold> Bug reported Bugid: #<[nummer]>
    - <[day]>/<[month]>/<[year]> - <[Zeit]>
    - Von-<[player].name>
    - #########################################
    - <[bug].space_separated>
    - #########################################
    - Vielen Dank das du Tendral besser machst!
    inventory:
    - <red><bold><[day]>/<[month]>/<[year]> - <[Zeit]>
    - <red><bold>Von-<[player].name>
    - <red><bold><[bug].space_separated>
    - <dark_red>click to delete
    log:
    - <[day]>/<[month]>/<[year]> - <[Zeit]>
    - Bug <[nummer]>
    - <[player].name>
    - <[bug].space_separated>

bugreport:
    type: command
    name: bugreport
    description: Report a bug
    usage: /bugreport <&lt>arg<&gt>
    permission: tendral.bugreport
    script:
    - if !<server.has_flag[bugreport]>:
        - flag server bugreport
        - flag server bugreport.anzahl: 0
        - flag server bugreport.statistik: 0
        - flag server bugreport.list: []
    - if <context.args.is_empty>:
        - narrate "Bitte gebe einen Bug ein."
    - else:
        - define bug <context.args.get[1].to[last]>
        - define player <player>
        - define day <util.time_now.format[dd]>
        - define month <util.time_now.format[MM]>
        - define year <util.time_now.format[yyyy]>
        - define Zeit <util.time_now.format[HH:mm:ss]>
        - flag server bugreport.anzahl:++
        - flag server bugreport.statistik:++
        - flag server bugreport.list:->:bug_<server.flag[bugreport.anzahl]>
        - define nummer <server.flag[bugreport.anzahl]>
        - definemap bugmap:
            nummer: <server.flag[bugreport.anzahl]>
            player_uuid: <[player]>
            tag: <[day]>
            monat: <[month]>
            jahr: <[year]>
            zeit: <[Zeit]>
            bug: <[bug]>
        - flag server bug_<server.flag[bugreport.anzahl]>:<[bugmap]>
        - narrate <script[bugdata].parsed_key[report].separated_by[<&nl>]>
        - ~log <script[bugdata].parsed_key[log].separated_by[<&nl>]> type:none file:/bug/bug_<server.flag[bugreport.anzahl]>.log

bugreport_inventory:
    type: inventory
    inventory: chest
    gui: true
    procedural items:
    - define result <list>
    - define first_entry <player.flag[bugreport_inventory_first]>
    - define last_entry <player.flag[bugreport_inventory_last]>
    - define buglistsize <server.flag[bugreport.list].size>
    - define pagesize <server.flag[bugreport.list].get[<[first_entry]>].to[<[last_entry]>].size>
    - define slots 45
    - define filler <[slots].sub[<[pagesize]>]>
    - if <server.flag[bugreport.list].is_empty>:
        - stop
    - foreach <server.flag[bugreport.list].get[<[first_entry]>].to[<[last_entry]>]>:
        - define player <server.flag[<[value]>.player_uuid]>
        - define day <server.flag[<[value]>.tag]>
        - define month <server.flag[<[value]>.monat]>
        - define year <server.flag[<[value]>.jahr]>
        - define zeit <server.flag[<[value]>.zeit]>
        - define bug <server.flag[<[value]>.bug]>
        - define nummer <server.flag[<[value]>.nummer]>
        - define item player_head[display_name=<red><bold>Bug<&sp>#<[nummer]>;skull_skin=<[player].uuid>;lore=<script[bugdata].parsed_key[inventory].separated_by[<&nl>]>;flag=bug:<[value]>]
        - define result <[result].include[<[item]>]>
    - repeat <[filler]>:
        - define filler air
        - define result <[result].include[<[filler]>]>
    - if <[first_entry]> > 1:
        - define zurueck arrow[display_name=zurück]
        - define result <[result].include[<[zurueck]>]>
    - if <[first_entry]> == 1:
        - define zurueck air
        - define result <[result].include[<[zurueck]>]>
    - if <[last_entry]> > <[buglistsize]>:
        - define weiter air
        - define result <[result].include[<[weiter]>]>
    - if <[last_entry]> < <[buglistsize]>:
        - define weiter arrow[display_name=weiter]
        - define result <[result].include[<[weiter]>]>
    - determine <[result]>
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [air] [air] [] [air] [air] [air] [] [air] [air]

bugreport_inventory_click:
    type: world
    events:
        on player clicks item in bugreport_inventory:
        - choose <context.slot>:
            - case 48:
                - if <player.flag[bugreport_inventory_first]> > 1:
                    - flag <player> bugreport_inventory_first:-:45
                    - flag <player> bugreport_inventory_last:-:45
                    - inventory open d:bugreport_inventory
                - else:
                    - determine cancelled
            - case 52:
                - if <server.flag[bugreport.list].size> > <player.flag[bugreport_inventory_last]>:
                    - flag <player> bugreport_inventory_first:+:45
                    - flag <player> bugreport_inventory_last:+:45
                    - inventory open d:bugreport_inventory
                - else:
                    - determine cancelled
            - default:
                - if <context.item.has_flag[bug]>:
                    - flag server <context.item.flag[bug]>:!
                    - flag server bugreport.list:<-:<context.item.flag[bug]>
                    - inventory open d:bugreport_inventory
                - else:
                    - determine cancelled
bugreport_inventory_command:
    type: command
    name: buginventory
    description: Does something
    usage: /buginventory <&lt>arg<&gt>
    permission: dscript.mycmd
    script:
    - flag <player> bugreport_inventory_first:1
    - flag <player> bugreport_inventory_last:45
    - inventory open d:bugreport_inventory
#1 - 45 46 90