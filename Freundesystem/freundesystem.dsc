Friend:
    type: command
    name: friend
    description: Does something
    usage: /friend <&lt>arg<&gt>
    permission: tendral.freunde
    tab completions:
        1: list|add|remove|accept|deny
        2: <server.online_players.parse[name].if_null[NULL]>
    script:
    - define absender <player>
    - define empfänger <server.match_offline_player[<context.args.get[2]>]>
    - choose <context.args.get[1]>:
        - case == list:
            - foreach <player.flag[Freundesliste.Freunde]> as:p:
                - define zahl 0
                - if <[p].is_online>:
                    - define color <green>
                    - define zahl:++
                - else:
                    - define color <red>
                - define name <[p].name>
                - define list <list>
                - define ende <[color]><[name]>
                - define list <[list].include[<[ende]>]>
            - narrate <script[Freunde_Data].parsed_key[Chat].separated_by[<&nl>]>
        - case == add:
            - if <context.args.get[2]> == <player.name>:
                - narrate "<script[Freunde_Data].parsed_key[Add1].separated_by[<&nl>]>"
                - determine cancelled
            - if <context.args.get[2].if_null[NULL]> == NULL:
                - narrate "<script[Freunde_Data].parsed_key[Add2].separated_by[<&nl>]>"
                - determine cancelled
            - if <[empfänger].flag[Freundesliste.Anfragen].contains[<[absender]>]>:
                - narrate "<script[Freunde_Data].parsed_key[Add3].separated_by[<&nl>]>"
                - determine cancelled
            - if <[empfänger].flag[Freundesliste.Freunde].contains[<[absender]>]>:
                - narrate "<script[Freunde_Data].parsed_key[Add4].separated_by[<&nl>]>"
                - determine cancelled
            - else:
                - flag <[absender]> Freundesliste.Ausgang:->:<[empfänger]>
                - flag <[empfänger]> Freundesliste.Anfragen:->:<[absender]>
                - toast "<script[Freunde_Data].parsed_key[Toast].separated_by[<&nl>]>" icon:player_head[skull_skin=<[absender].uuid>] targets:<[empfänger]>
                - playsound <[empfänger]> sound:ENTITY_PLAYER_LEVELUP volume:1.0 pitch:0.6
                - narrate "<script[Freunde_Data].parsed_key[Anfrage].separated_by[<&nl>]>" targets:<[empfänger]>
                - narrate "<script[Freunde_Data].parsed_key[Anfrage2].separated_by[<&nl>]>" targets:<[absender]>
        - case == remove:
            - if <[empfänger].flag[Freundesliste.Freunde].contains[<[absender]>]>:
                - flag <[absender]> Freundesliste.Freunde:<-:<[empfänger]>
                - flag <[empfänger]> Freundesliste.Freunde:<-:<[absender]>
                - narrate "<script[Freunde_Data].parsed_key[Remove].separated_by[<&nl>]>" targets:<[absender]>
            - else:
                - narrate "Du bist nicht mit dieser Person befreundet."
        - case == accept:
            - if <[empfänger].flag[Freundesliste.Ausgang].contains[<[absender]>]>:
                - flag <[absender]> Freundesliste.Anfragen:<-:<[empfänger]>
                - flag <[empfänger]> Freundesliste.Ausgang:<-:<[absender]>
                - flag <[absender]> Freundesliste.Freunde:->:<[empfänger]>
                - flag <[empfänger]> Freundesliste.Freunde:->:<[absender]>
                - narrate "<script[Freunde_Data].parsed_key[Accept].separated_by[<&nl>]>" targets:<[absender]>
                - narrate "<script[Freunde_Data].parsed_key[Accept2].separated_by[<&nl>]>" targets:<[empfänger]>
                - toast "<script[Freunde_Data].parsed_key[Toast2].separated_by[<&nl>]>" icon:player_head[skull_skin=<[absender].uuid>] targets:<[empfänger]>
                - playsound <[empfänger]> sound:ENTITY_PLAYER_LEVELUP volume:1.0 pitch:0.6
                - toast "<script[Freunde_Data].parsed_key[Toast3].separated_by[<&nl>]>" icon:player_head[skull_skin=<[empfänger].uuid>] targets:<[absender]>
                - playsound <[absender]> sound:ENTITY_PLAYER_LEVELUP volume:1.0 pitch:0.6
            - else:
                - narrate "Du hast keine Anfrage von dieser Person!"
        - case == deny:
            - if <[empfänger].flag[Freundesliste.Ausgang].contains[<[absender]>]>:
                - flag <[absender]> Freundesliste.Anfragen:<-:<[empfänger]>
                - flag <[empfänger]> Freundesliste.Ausgang:<-:<[absender]>
                - narrate "<script[Freunde_Data].parsed_key[Deny].separated_by[<&nl>]>" targets:<[absender]>
            - else:
                - narrate "Du hast keine Anfrage von dieser Person!"

Freunde_Data:
  type: data
  Toast:
    - "<gold>۞ <[Absender].name> <gold>۞"
    - "<gold>۞ Freundesanfrage <gold>۞"
  Toast2:
    - "<gold>۞ <[Absender].name> <gold>۞"
    - "<gold>۞ Freundesanfrage angenommen <gold>۞"
  Toast3:
    - "<gold>۞ <[Empfänger].name> <gold>۞"
    - "<gold>۞ Freundesanfrage angenommen <gold>۞"
  Chat:
    - "<white><bold><&m>======================"
    - "<gold>۞ Freunde online: <[zahl]>"
    - "<gold>۞ <[list].separated_by[<&sp>]>"
    - "<white><bold><&m>======================"
  Anfrage:
    - "<white><bold><&m>======================"
    - "<gold>۞ <[Absender].name> <gold>۞"
    - "<gold>۞ Freundesanfrage <gold>۞"
    - "<gold>۞ benutze <green>/friend accept <[absender].name> <gold>oder <red>/friend deny <[absender].name> <gold>۞"
    - "<white><bold><&m>======================"
  Anfrage2:
    - "<white><bold><&m>======================"
    - "<gold>۞ Anfrage <gold>۞"
    - "<gold>۞ Freundesanfrage an <green><[empfänger].name> <gold>gesendet ۞"
    - "<white><bold><&m>======================"
  Deny:
    - "<white><bold><&m>======================"
    - "<gold>۞ Abgelehnt <gold>۞"
    - "<gold>۞ Freundesanfrage von <red><[empfänger].name> <gold>abgelehnt. ۞"
    - "<white><bold><&m>======================"
  Remove:
    - "<white><bold><&m>======================"
    - "<gold>۞ Entfernt <gold>۞"
    - "<gold>۞ Du hast <red><[empfänger].name> <gold>entfernt. ۞"
    - "<white><bold><&m>======================"
  Accept:
    - "<white><bold><&m>======================"
    - "<gold>۞ Angenommen <gold>۞"
    - "<gold>۞ Freundesanfrage von <green><[empfänger].name> <gold>angenommen. ۞"
    - "<white><bold><&m>======================"
  Accept2:
    - "<white><bold><&m>======================"
    - "<gold>۞ Angenommen <gold>۞"
    - "<gold>۞ <green><[empfänger].name> <gold>hat deine Anfrage angenommen. ۞"
    - "<white><bold><&m>======================"
  Add1:
    - "<white><bold><&m>======================"
    - "<gold>۞ <red>Fehler <gold>۞"
    - "<gold>۞ Du kannst nicht dein <red>eigener Freund <gold>sein. ۞"
    - "<white><bold><&m>======================"
  Add2:
    - "<white><bold><&m>======================"
    - "<gold>۞ <red>Fehler <gold>۞"
    - "<gold>۞ Gib einen <red>Spielernamen <gold>ein. ۞"
    - "<white><bold><&m>======================"
  Add3:
    - "<white><bold><&m>======================"
    - "<gold>۞ <red>Fehler <gold>۞"
    - "<gold>۞ <green><[empfänger].name> <gold>hat schon eine Anfrage. ۞"
    - "<white><bold><&m>======================"
  Add4:
    - "<white><bold><&m>======================"
    - "<gold>۞ <red>Fehler <gold>۞"
    - "<gold>۞ Ihr seid bereits befreundet. ۞"
    - "<white><bold><&m>======================"

Freund_Data_GUI:
  type: data
  Name: "<gold>۞ <[name]> <gold>۞"
  GUI:
    - "<white><bold><&m>======================"
    - "<gold>۞ Level: <[Level]>"
    - "<gold>۞ Standort: <[coords]>"
    - "<gold>۞ Status: <[color]><[status]>"
    - "<white><bold><&m>======================"
  GUI_Offline:
    - "<white><bold><&m>======================"
    - "<gold>۞ Level: <[Level]>"
    - "<gold>۞ Standort: "
    - "<gold>۞ Status: <[color]><[status]>"
    - "<gold>۞ Letzter Login: <[color]><[Datum]>"
    - "<white><bold><&m>======================"

Freundes_Gui:
    type: inventory
    inventory: chest
    gui: true
    title: <gold>۞ Freunde ۞
    debug: false
    definitions:
      back: black_stained_glass_pane
      links: arrow
      rechts: arrow
      anfragen: paper[display_name=anfragen]
      ausgang: paper[display_name=ausgang]
    procedural items:
    - define result <list>
    - define online <list>
    - define offline <list>
    - foreach <player.flag[Freundesliste.Freunde]> as:f:
        - if <[f].is_online>:
            - define online:->:<[f]>
        - else:
            - define offline:->:<[f]>
    - foreach <[online].include[<[offline]>]> as:l:
        - if <[l].is_online>:
            - define name <[l].name>
            - define level <[l].flag[<player.flag[Profil]>.Level]>
            - define online <list>
            - define status online
            - define color <green>
            - define coords <[l].location.simple>
            - define item player_head[display_name=<script[Freund_Data_GUI].parsed_key[Name]>;skull_skin=<[l].uuid>;lore=<script[Freund_Data_GUI].parsed_key[GUI].separated_by[<&nl>]>]
        - else:
            - define name <[l].name>
            - define level <[l].flag[<player.flag[Profil]>.Level]>
            - define offline <list>
            - define status offline
            - define color <red>
            - define datum <[l].last_played_time.format[dd/MM/yyyy]>
            - define item player_head[display_name=<script[Freund_Data_GUI].parsed_key[Name]>;skull_skin=<[l].uuid>;lore=<script[Freund_Data_GUI].parsed_key[GUI_Offline].separated_by[<&nl>]>]
        - define result <[result].include[<[item]>]>
    - determine <[result].deduplicate>
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [back] [] [anfragen] [ausgang] [] [links] [] [rechts] []

Freund_world:
  type: world
  events:
    on player joins:
    - if <player.has_flag[Freundesliste]>:
      - stop
    - else:
      - definemap Freundesliste:
          Freunde: []
          Anfragen: []
          Ausgang: []
      - flag <player> freundesliste:<[Freundesliste]>
