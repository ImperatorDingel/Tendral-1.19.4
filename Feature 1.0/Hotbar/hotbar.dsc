Hotbar:
    type: world
    events:
        #Menü
        on player left clicks block with:Menu_item:
        - determine passively cancelled
        - ratelimit <player> 1t
        - inventory open d:Hauptmenue_inventory
        on player right clicks block with:Menu_item:
        - determine passively cancelled
        - ratelimit <player> 1t
        - inventory open d:Hauptmenue_inventory
        on player clicks Menu_item in inventory:
        - if <context.slot> == 9:
            - determine passively cancelled
            - ratelimit <player> 1t
            - inventory open d:Hauptmenue_inventory
        on player drops Menu_item:
        - determine passively cancelled
        on player swaps items offhand:Menu_item:
        - determine cancelled
        #Rucksack
        on player left clicks block with:Rucksack_item:
        - determine passively cancelled
        - ratelimit <player> 1t
        - inventory open d:<player.flag[<player.flag[Profil]>.Rucksack]>
        on player right clicks block with:Rucksack_item:
        - determine passively cancelled
        - ratelimit <player> 1t
        - inventory open d:<player.flag[<player.flag[Profil]>.Rucksack]>
        on player clicks Rucksack_item in inventory:
        - if <context.slot> == 8:
            - determine passively cancelled
            - ratelimit <player> 1t
            - inventory open d:<player.flag[<player.flag[Profil]>.Rucksack]>
        on player drops Rucksack_item:
        - determine passively cancelled
        on player swaps items offhand:Rucksack_item:
        - determine cancelled