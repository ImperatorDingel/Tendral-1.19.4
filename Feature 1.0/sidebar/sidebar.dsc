Sidebar_data:
    type: data
    debug: false
    sidebar:
        - <empty>
        - <&chr[Eff9].font[economy-icons]> <gold><bold><[day]> <proc[Month_formatter].context[<[month]>]>, <[year]>
        - <&chr[Eff8].font[economy-icons]> <gold><bold><[Zeit]>
        - <empty>
        - <gold><bold><[name]> [<proc[Profil_formatter].context[<[profil]>]>]
        - <&chr[1005].font[economy-icons]> <gold><bold>Rang: Admin
        - <&chr[1004].font[economy-icons]> <gold><bold>Level: <[level]>
        - <&chr[1006].font[economy-icons]> <gold><bold>Exp: <[xp]>/<[MaxXp]>
        - <gold><bold>[<reset><[XpBarCompact]><gold><bold>]
        - <yellow><&chr[1001].font[economy-icons]><gold><bold>Geld
        - <[money]>
        - <empty>
        - <&chr[1002].font[economy-icons]> <gold><bold>Tendralcraft.de
        - <&chr[1003].font[economy-icons]> <gold>Toggle mit /sidebar

sidebar_world:
    type: world
    debug: false
    events:
        on delta time secondly:
        - run sidebar_task

Sidebar_command:
    type: command
    name: sidebar
    description: Opens the Sidebar
    usage: /sidebar
    permission: dscript.mycmd
    debug: false
    script:
    - define logo <&chr[Eff7].font[economy-icons]>
    - define day <util.time_now.format[dd]>
    - define month <util.time_now.format[MM]>
    - define year <util.time_now.format[yyyy]>
    - define Profil <player.flag[Profil]>
    - define Zeit <util.time_now.format[HH:mm:ss]>
    - define money <player.flag[<player.flag[Profil]>.Economy.Money].add[<player.flag[<player.flag[Profil]>.Economy.Bank]>]>
    - if <player.has_flag[sidebar]>:
        - flag <player> sidebar:!
        - sidebar remove
    - else:
        - flag <player> sidebar
        - sidebar set "title:<[logo]>" "values:<script[Sidebar_data].parsed_key[sidebar].separated_by[|]>" players:<player>

sidebar_task:
    type: task
    debug: false
    script:
    - if <server.online_players_flagged[sidebar].is_empty>:
        - stop
    - foreach <server.online_players_flagged[sidebar]> as:p:
        - define logo <&chr[Eff7].font[economy-icons]>
        - define day <util.time_now.format[dd]>
        - define month <util.time_now.format[MM]>
        - define year <util.time_now.format[yyyy]>
        - define Profil <[p].flag[Profil]>
        - define Zeit <util.time_now.format[HH:mm:ss]>
        - define name <[p].name>
        - define Xp <proc[metric_number].context[<[p].flag[<[p].flag[Profil]>.EXP.Exp]>]>
        - define MaxXp <proc[metric_number].context[<[p].flag[<[p].flag[Profil]>.EXP.Target]>]>
        - define XpBarCompact <[p].flag[<[p].flag[Profil]>.ExpBar.Level]>
        - define level <[p].flag[<[p].flag[Profil]>.Level]>
        - define money <server.economy.format[<[p].flag[<[p].flag[Profil]>.Economy.Money]>]>
        - sidebar set title:<[logo]> values:<script[Sidebar_data].parsed_key[sidebar].separated_by[|]> players:<[p]>
        

Month_formatter:
    type: procedure
    definitions: date
    debug: false
    script:
    - choose <[date]>:
        - case 01:
            - define month Jan
        - case 02:
            - define month Feb
        - case 03:
            - define month Mär
        - case 04:
            - define month Apr
        - case 05:
            - define month Mai
        - case 06:
            - define month Jun
        - case 07:
            - define month Jul
        - case 08:
            - define month Aug
        - case 09:
            - define month Sep
        - case 10:
            - define month Okt
        - case 11:
            - define month Nov
        - case 12:
            - define month Dez
    - determine <[month]>

Profil_formatter:
    type: procedure
    definitions: Profil
    debug: false
    script:
    - choose <[Profil]>:
        - case Profil_1:
            - define profil P1
    - determine <[profil]>