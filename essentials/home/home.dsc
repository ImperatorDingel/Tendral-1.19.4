Home_World:
    type: world
    events:
        after player joins:
        - if <player.has_flag[Homes_Anzahl]>:
            - determine cancelled
        - else:
            - flag <player> Homes_Anzahl:3
            - flag <player> Homes_Counter:0
            - flag <player> Homes_Max:28
Home:
    type: command
    name: home
    description: Does something
    usage: /home <&lt>arg<&gt>
    tab completions:
        1: <player.flag[Homes]>
    script:
    - define ziel <context.args.get[1]>
    - if <server.worlds.contains[<player.flag[<[ziel]>.World]>]>:
        - if <player.flag[Homes].contains[<[ziel]>]>:
            - teleport <player> <player.flag[<[ziel]>.LOC]>
            - narrate "Du hast dich zum Home [<[ziel]>] teleportiert." format:HomeFormat
            - flag <player> Mana:0
        - else:
            - narrate "<red><bold>Diesen Home Punkt gibt es nicht!" format:HomeFormat
Sethome:
    type: command
    name: sethome
    description: Does something
    usage: /sethome <&lt>arg<&gt>
    script:
    - if <player.flag[Homes_Counter]> < <player.flag[Homes_Anzahl]>:
        - define NAME <context.args.get[1].if_null[null]>
        - define DATE <util.time_now.format[dd.MM.yyyy]>
        - define LOCATION <player.location>
        - define WORLD <player.world>
        - if <[NAME]> = null:
            - narrate "Gib bitte einen Home Namen an." format:HomeFormat
        - else:
            - if <player.flag[Homes].contains[<[NAME]>]>:
              - narrate "Gib bitte einen anderen Home Namen an." format:HomeFormat
              - determine cancelled
            - else:
                - flag <player> Homes:->:<[NAME]>
                - flag <player> <[NAME]>.Zeit:<[DATE]>
                - flag <player> <[NAME]>.LOC:<[LOCATION]>
                - flag <player> <[NAME]>.World:<[WORLD]>
                - flag <player> Homes_Counter:++
                - narrate "Home Punkt [<green><bold><[Name]><white><bold>] wurde erstellt." format:HomeFormat
    - else:
        - narrate "Du hast leider keine Home Plätze mehr frei." format:HomeFormat
DelHome:
    type: command
    name: Delhome
    description: Does something
    usage: /delhome <&lt>arg<&gt>
    script:
    - define Home <context.args.get[1].if_null[null]>
    - if <[Home]> == null:
        - narrate "Gib bitte einen Home Namen zum löschen ein." format:HomeFormat
    - if <player.flag[Homes].contains[<[Home]>]>:
        - flag <player> Homes:<-:<[Home]>
        - flag <player> <[Home]>:!
        - flag <player> Homes_Counter:--
        - if <player.flag[Homes_Counter]> == 0:
            - flag <player> Homes:!
        - narrate "Home Punkt [<red><bold><[Home]><white><bold>] wurde gelöscht." format:HomeFormat
    - else:
        - narrate "Diesen Home Punkt gibt es nicht!" format:HomeFormat
Homes:
    type: command
    name: homes
    description: Does something
    usage: /homes <&lt>arg<&gt>
    script:
        - inventory open d:Homes_inventory

Homes_inventory:
    debug: false
    title: Homes
    type: inventory
    inventory: chest
    gui: true
    definitions:
      b: Black_stained_glass_pane[display_name=<&sp>]
      z: light_gray_stained_glass_pane[display_name=<red><bold>Zurück]
    procedural items:
    - define list <list>
    - define slots <player.flag[Homes_max].sub[<player.flag[Homes_Anzahl]>]>
    - define homes <player.flag[Homes_Anzahl].sub[<player.flag[Homes_Counter]>]>
    - if <player.has_flag[Homes]>:
        - foreach <player.flag[Homes]>:
            - define DisplayName <green><bold><[value]>
            - define Location "<green><bold>Coords: <player.flag[<[value]>.LOC].xyz.as_location.simple>"
            - define Zeit "<green><bold>created: <player.flag[<[value]>.Zeit]>"
            - define Welt "<green><bold>world: <player.flag[<[value]>.LOC].world.name>"
            - define item player_head[display_name=<[DisplayName]>;lore=<[Location]><&nl><[Welt]><&nl><&n><[Zeit]>;skull_skin=<player.uuid>]
            - define list <[list].include[<[item]>]>
    - repeat <[homes]>:
        - define item green_stained_glass_pane
        - define list <[list].include[<[item]>]>
    - repeat <[slots]>:
        - define item red_stained_glass_pane
        - define list <[list].include[<[item]>]>
    - define list <[list].include[<[item]>]>
    - determine <[list]>
    slots:
    - [b] [b] [b] [b] [b] [b] [b] [b] [b]
    - [b] [] [] [] [] [] [] [] [b]
    - [b] [] [] [] [] [] [] [] [b]
    - [b] [] [] [] [] [] [] [] [b]
    - [b] [] [] [] [] [] [] [] [b]
    - [z] [b] [b] [b] [b] [b] [b] [b] [b]

Homes_Inventory_click:
    type: world
    events:
        on player clicks in Homes_inventory:
        - define Home Stone
        - define open green_stained_glass_pane
        - define closed red_stained_glass_pane
        - define border black_stained_glass_pane[display_name=<&sp>]
        - define zuruck light_gray_stained_glass_pane[display_name=<red><bold>Zurück]
        - if <context.slot_type> == CONTAINER:
            - if <context.item> == <item[<[border]>]>:
                - determine cancelled
            - if <context.item> == <item[<[open]>]>:
                - narrate "Das ist ein freier Home Platz." format:HomeFormat
                - determine cancelled
            - if <context.item> == <item[<[closed]>]>:
                - narrate "Diesen Home Slot hast du noch nicht freigeschaltet." format:HomeFormat
                - determine cancelled
            - if <context.item> == <item[<[zuruck]>]>:
                - inventory open d:NewMenuDimension
            - else:
                - define teleport <player.flag[Homes].closest_to[<context.item.display>]>
                - if <server.worlds.contains[<player.flag[<[teleport]>.World]>]>:
                    - teleport <player> <player.flag[<[teleport]>.LOC]>
                    - define ziel <green><bold><[teleport]><white><bold>
                    - flag <player> Mana:0
                    - narrate "Du hast dich zum Home [<[ziel]>] teleportiert." format:HomeFormat
                - else:
                    - narrate "Welt existiert nicht mehr bitte Lösche diesen Home."

HomeFormat:
  type: format
  debug: false
  format: <green><bold>[Home] <white><bold><[text]>