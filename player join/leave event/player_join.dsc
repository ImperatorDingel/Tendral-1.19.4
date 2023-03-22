Player_join:
    type: world
    events:
        on bungee player joins network:
        - flag <player> Profil:!
        - if <player.has_permission[tendral.default]>:
            - define prefix "<white>[Neuling]"
        - if <player.has_permission[tendral.spieler]>:
            - define prefix "<blue>[Spieler]"
        - if <player.has_permission[tendral.bronze]>:
            - define prefix "<yellow>[Held]"
        - announce "<green>[+] <[prefix]> <gold><player.name>"
        - flag server online_players:->:<player>
        - determine none
        on player joins:
        - determine none
        after player joins:
        - adjust <player> scale_health:true
        - team name:nameplates add:<player>
        - team name:nameplates option:name_tag_visibility status:never
        - team name:nameplates option:collision_rule status:never
        - adjust <player> hide_from_players
        - if <player.has_flag[Profil]>:
            - determine passively cancelled
        - else:
            - teleport <player> d:Profil_auswahl
            - inventory open d:Profil_auswahl_inventory
        - determine none
        on player quits:
        - if <player.has_flag[nameplate]>:
            - kill <player.flag[nameplate]>
            - flag <player> nameplate:!
        - flag <player> <player.flag[Profil]>.Inventory:<player.inventory.list_contents>
        - inventory clear
        - determine none
        after player quits:
        - determine none
        on bungee player leaves network:
        - announce "<red>[-] <gold><player.name>"
        - flag server online_players:<-:<player>
        after bungee player switches to server:
        - if <player.has_flag[Profil]>:
            - if <context.server> == <bungee.server>:
                - flag <player> <player.flag[Profil]>.Server:!
                - determine passively cancelled
            - else:
                - flag <player> <player.flag[Profil]>.Server:<context.server>