Hotbar:
    type: world
    events:
        #Menü
        on player left clicks block with:Menu_item:
        - ratelimit <player> 1t
        on player right clicks block with:Menu_item:
        - ratelimit <player> 1t
        on player clicks Menu_item in inventory:
        - determine passively cancelled
        - ratelimit <player> 1t
        on player drops Menu_item:
        - determine passively cancelled
        on player swaps items offhand:Menu_item:
        - determine cancelled
        #Rucksack
        on player left clicks block with:Rucksack_item:
        - ratelimit <player> 1t
        on player right clicks block with:Rucksack_item:
        - ratelimit <player> 1t
        on player clicks Rucksack_item in inventory:
        - determine passively cancelled
        - ratelimit <player> 1t
        on player drops Rucksack_item:
        - determine passively cancelled
        on player swaps items offhand:Rucksack_item:
        - determine cancelled
        #Questbuch
        on player left clicks block with:Questbuch:
        - ratelimit <player> 1t
        on player right clicks block with:Questbuch:
        - ratelimit <player> 1t
        on player clicks Questbuch in inventory:
        - determine passively cancelled
        - ratelimit <player> 1t
        on player drops Questbuch:
        - determine passively cancelled
        on player swaps items offhand:Questbuch:
        - determine cancelled