smithing:
    type: world
    events:
        on player right clicks anvil:
        - determine passively cancelled
        - definemap smithing_inventory:
            page: 1
            item: empty
        - flag <player> inventory.smithing:<[smithing_inventory]>
        - inventory open d:smithing_inventory

smithing_inventory:
    type: inventory
    inventory: chest
    gui: true
    definitions:
      ingots: iron_ingot
      weapons: iron_sword
      tools: iron_pickaxe
      armor: iron_chestplate
      back: arrow
      next: arrow
    procedural items:
    - define list <list>
    - if <player.flag[inventory.smithing.item]> == empty:
        - repeat 24:
            - define item air
        - define list <[list].include[<[item]>]>
    - if <player.flag[inventory.smithing.item]> == ingots:
        - define page <script[Smithing_data].parsed_key[Barren.Page<player.flag[inventory.smithing.page]>]>
        - foreach <[page]>:
            - if <[value]> == Tendral_bronze_ingot:
                - define item <item[<[value]>].with[quantity=2]>
                - define list <[list].include[<[item]>]>
            - else:
                - define item <[value]>
                - define list <[list].include[<[item]>]>
    - if <player.flag[inventory.smithing.item]> == weapons:
        - define page <script[Smithing_data].parsed_key[Weapons.Page1]>
        - foreach <[page]>:
            - define item <[value]>
            - define list <[list].include[<[item]>]>
    - if <player.flag[inventory.smithing.item]> == tools:
        - define page <script[Smithing_data].parsed_key[tools.Page1]>
        - foreach <[page]>:
            - define item <[value]>
            - define list <[list].include[<[item]>]>
    - if <player.flag[inventory.smithing.item]> == armor:
        - define page <script[Smithing_data].parsed_key[armor.Page1]>
        - foreach <[page]>:
            - define item <[value]>
            - define list <[list].include[<[item]>]>
    - determine <[list]>
    slots:
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [ingots] [air] [] [] [] [] [] [] [air]
    - [weapons] [air] [] [] [] [] [] [] [air]
    - [tools] [air] [] [] [] [] [] [] [air]
    - [armor] [air] [] [] [] [] [] [] [air]
    - [] [] [back] [] [] [] [] [next] []

smithing_inventory_click_handler:
    type: world
    events:
        on player clicks item in smithing_inventory:
        - if <player.flag[inventory.smithing.item]> == empty:
            - choose <context.slot>:
                # auswahl
                - case 10:
                    - flag <player> inventory.smithing.item:ingots
                    - inventory open d:smithing_inventory
                - case 19:
                    - flag <player> inventory.smithing.item:weapons
                    - inventory open d:smithing_inventory
                - case 28:
                    - flag <player> inventory.smithing.item:tools
                    - inventory open d:smithing_inventory
                - case 37:
                    - flag <player> inventory.smithing.item:armor
                    - inventory open d:smithing_inventory
                - case 48:
                    - if <player.flag[inventory.smithing.page]> == 1:
                        - determine passively cancelled
                    - else:
                        - flag <player> inventory.smithing.page:--
                        - inventory open d:smithing_inventory
                - case 53:
                    - if <player.flag[inventory.smithing.page]> == 3:
                        - determine passively cancelled
                    - else:
                        - flag <player> inventory.smithing.page:++
                        - inventory open d:smithing_inventory
        # Ingots Crafting Tab
        - if <player.flag[inventory.smithing.item]> == ingots:
            - choose <context.slot>:
                # auswahl
                - case 10:
                    - flag <player> inventory.smithing.item:ingots
                    - inventory open d:smithing_inventory
                - case 19:
                    - flag <player> inventory.smithing.item:weapons
                    - inventory open d:smithing_inventory
                - case 28:
                    - flag <player> inventory.smithing.item:tools
                    - inventory open d:smithing_inventory
                - case 37:
                    - flag <player> inventory.smithing.item:armor
                    - inventory open d:smithing_inventory
                - case 48:
                    - if <player.flag[inventory.smithing.page]> == 1:
                        - determine passively cancelled
                    - else:
                        - flag <player> inventory.smithing.page:--
                        - inventory open d:smithing_inventory
                - case 53:
                    - if <player.flag[inventory.smithing.page]> == 3:
                        - determine passively cancelled
                    - else:
                        - flag <player> inventory.smithing.page:++
                        - inventory open d:smithing_inventory
                # auswahl ende
                - case 34:
                    # Craft Bronze Ingot
                    - if <player.inventory.contains_item[Tendral_copper_ingot].quantity[1]> && <player.inventory.contains_item[tendral_tin_ingot].quantity[1]>:
                        - take item:Tendral_copper_ingot quantity:1
                        - take item:tendral_tin_ingot quantity:1
                        - give Tendral_bronze_ingot quantity:2
                        - narrate "Ging durch"
        - if <player.flag[inventory.smithing.item]> == weapons:
            - choose <context.slot>:
                # auswahl
                - case 10:
                    - flag <player> inventory.smithing.item:ingots
                    - inventory open d:smithing_inventory
                - case 19:
                    - flag <player> inventory.smithing.item:weapons
                    - inventory open d:smithing_inventory
                - case 28:
                    - flag <player> inventory.smithing.item:tools
                    - inventory open d:smithing_inventory
                - case 37:
                    - flag <player> inventory.smithing.item:armor
                    - inventory open d:smithing_inventory
                - case 48:
                    - if <player.flag[inventory.smithing.page]> == 1:
                        - determine passively cancelled
                    - else:
                        - flag <player> inventory.smithing.page:--
                        - inventory open d:smithing_inventory
                - case 53:
                    - if <player.flag[inventory.smithing.page]> == 3:
                        - determine passively cancelled
                    - else:
                        - flag <player> inventory.smithing.page:++
                        - inventory open d:smithing_inventory
                # auswahl ende
        - if <player.flag[inventory.smithing.item]> == tools:
            - choose <context.slot>:
                # auswahl
                - case 10:
                    - flag <player> inventory.smithing.item:ingots
                    - inventory open d:smithing_inventory
                - case 19:
                    - flag <player> inventory.smithing.item:weapons
                    - inventory open d:smithing_inventory
                - case 28:
                    - flag <player> inventory.smithing.item:tools
                    - inventory open d:smithing_inventory
                - case 37:
                    - flag <player> inventory.smithing.item:armor
                    - inventory open d:smithing_inventory
                - case 48:
                    - if <player.flag[inventory.smithing.page]> == 1:
                        - determine passively cancelled
                    - else:
                        - flag <player> inventory.smithing.page:--
                        - inventory open d:smithing_inventory
                - case 53:
                    - if <player.flag[inventory.smithing.page]> == 3:
                        - determine passively cancelled
                    - else:
                        - flag <player> inventory.smithing.page:++
                        - inventory open d:smithing_inventory
                # auswahl ende
        - if <player.flag[inventory.smithing.item]> == armor:
            - choose <context.slot>:
                # auswahl
                - case 10:
                    - flag <player> inventory.smithing.item:ingots
                    - inventory open d:smithing_inventory
                - case 19:
                    - flag <player> inventory.smithing.item:weapons
                    - inventory open d:smithing_inventory
                - case 28:
                    - flag <player> inventory.smithing.item:tools
                    - inventory open d:smithing_inventory
                - case 37:
                    - flag <player> inventory.smithing.item:armor
                    - inventory open d:smithing_inventory
                - case 48:
                    - if <player.flag[inventory.smithing.page]> == 1:
                        - determine passively cancelled
                    - else:
                        - flag <player> inventory.smithing.page:--
                        - inventory open d:smithing_inventory
                - case 53:
                    - if <player.flag[inventory.smithing.page]> == 3:
                        - determine passively cancelled
                    - else:
                        - flag <player> inventory.smithing.page:++
                        - inventory open d:smithing_inventory
                # auswahl ende
        - narrate "Nice <context.item>"
        - narrate <context.slot>