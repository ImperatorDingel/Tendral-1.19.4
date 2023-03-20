Player_join:
    type: world
    events:
        on player joins:
        - determine none
        after player joins:
        - if <player.has_permission[tendral.default]>:
            - define prefix "<white>[Neuling]"
        - if <player.has_permission[tendral.spieler]>:
            - define prefix "<blue>[Spieler]"
        - if <player.has_permission[tendral.bronze]>:
            - define prefix "<yellow>[Held]"
        - announce "<green>[+] <[prefix]> <gold><player.name>"
        - teleport <player> d:Profil_auswahl
        - inventory open d:Profil_auswahl_inventory
        on player quits:
        - determine none
        after player quits:
        - announce "<red>[-] <gold><player.name>"