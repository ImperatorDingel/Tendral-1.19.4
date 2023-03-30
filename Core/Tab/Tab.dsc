MOTD:
    type: world
    debug: false
    events:
        on server list ping:
        - define 1 "<gold><bold>        Tendral - Alpha 0.1"
        - define 2 "<gold><bold>        RPG | WIRTSCHAFT"
        - determine <[1]><n><[2]>

Tableiste_Data:
    type: data
    debug: false
    ##Tags
    # - <[online]>
    # - <[players]>
    # - <[tps]>
    # - <[ping]>
    # - <[freunde]>
    # - <[gilde]>
    # - <[GildenMitglieder]>
    # - <[time]>
    # - <[motd]>
    # - <[date]>
    ###Header
    header:
    - <empty>
    - <empty>
    - <[logo]>
    - <empty>
    #- "<[SchwertL].color_gradient[from=<color[yellow]>;to=<color[gray]>]> <gold><bold>Tendral <[SchwertR].color_gradient[from=<color[gray]>;to=<color[yellow]>]>"
    - "<gold>۞ <bold>Server: <yellow><bold><[motd]> <gold>۞"
    - "<gold>۞ <bold>Spieler online: <yellow><bold><[online]>/<[maxslot]> <gold>۞"
    - "<gold>۞ TPS: <yellow><[tps]> <gold>Ping: <yellow><[ping]> <gold>۞"
    ###Footer
    footer:
    - ""
#    - "<gray><bold>Gilde: <green><bold><[Gilde]> [<[GildenMitglieder]>] <gray><bold>Freunde: <green><bold><[freunde]>"
    - "<gold>۞ <bold>Uhrzeit: <yellow><bold><[time]> <gold><bold>Datum: <yellow><bold><[date]> <gold>۞"
    - "<[SchwertL].color_gradient[from=<color[yellow]>;to=<color[gray]>]> <gold><bold>Tendral <[SchwertR].color_gradient[from=<color[gray]>;to=<color[yellow]>]>"
#    - "<gray><bold>www.Tendralcraft.de"
    ### Spieler
    players:
      singular: Spieler
  ###TPS
    server_tps:
     perfect_20:
      if_more_than: 19.97
      display: 20*
     good_20:
      if_more_than: 19.85
      display: 20
  ###Group Order
    enable_prefix_suffix: true
    enable_group_order: true
    group_order:
     A: gamemaster
     B: moderator
     C: streamer
     D: unterstützer
     E: ehrenmitglied
     F: stammspieler
     G: spieler
#
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
##~~~~~~~~~~~~~~~~~~~~~~~~~~TAB~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
#
###Tab task
interface_tab_world:
  type: world
  debug: false
  events:
    after player joins:
    - inject interface_tab_updater
    after player quits:
    - inject interface_tab_updater
    after delta time secondly every:1:
    - inject interface_tab_updater
###Updater
interface_tab_updater:
  type: task
  debug: false
  script:
  - if <server.online_players.is_empty>:
    - stop
  - foreach <server.online_players> as:p:
    - adjust <[p]> tab_list_info:<proc[interface_tab_maker].context[<[p]>]>
    - team name:<proc[interface_tab_list_name].context[<[p]>]> add:<[p]>
    - team name:<proc[interface_tab_list_name].context[<[p]>]> option:name_tag_visibility status:never
    - adjust <[p]> player_list_name:<script[Tableiste_Data].data_key[enable_prefix_suffix].if_true[<[p].chat_prefix.parse_color><[p].flag[nickname].if_null[<[p].name>]><[p].chat_suffix.parse_color>].if_false[<[p].flag[nickname].if_null[<[p].name>]>]>
###TPS Berechnung
interface_server_tps:
  type: procedure
  debug: false
  script:
  - define tps <server.recent_tps.average>
  - if <[tps]> > <script[Tableiste_Data].data_key[server_tps.perfect_20.if_more_than]>:
    - determine <script[Tableiste_Data].data_key[server_tps.perfect_20.display]>
  - else if <[tps]> > <script[Tableiste_Data].data_key[server_tps.good_20.if_more_than]>:
    - determine <script[Tableiste_Data].data_key[server_tps.good_20.display]>
  - else:
    - determine <server.recent_tps.average.round_up_to_precision[0.01]>
###Gruppierung der Gruppen
interface_tab_list_name:
  type: procedure
  debug: false
  definitions: p
  script:
  - if <script[Tableiste_Data].data_key[enable_group_order]>:
    - foreach <script[Tableiste_Data].data_key[group_order].keys.alphanumeric> as:G:
      - if <[p].groups.contains[<script[Tableiste_Data].data_key[group_order].get[<[G]>]>]>:
        - determine <[g]>
  - determine ZZZ
###Tab erstellen
interface_tab_maker:
  type: procedure
  debug: false
  definitions: p
  script:
  - define logo <&chr[Eff7].font[economy-icons]>
  - define tps <proc[interface_server_tps]>
  - define ping <[p].ping>
  - define online <server.online_players.size>
  - define freunde 0
  - define GildenMitglieder 0
  - define time <util.time_now.format[HH.mm.ss]>
  - define date <util.time_now.format[dd.MM.yyyy]>
  - define motd <server.motd>
  - define maxslot <server.max_players>
  - define SchwertL -=============[-❇
  - define SchwertR ❇-]=============-
  - determine <script[Tableiste_Data].parsed_key[header].separated_by[<&nl>]>|<script[Tableiste_Data].parsed_key[footer].separated_by[<&nl>]>