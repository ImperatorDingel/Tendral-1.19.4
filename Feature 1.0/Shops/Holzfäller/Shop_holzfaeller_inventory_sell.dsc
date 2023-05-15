Shop_holzfaeller_inventory_sell_data:
    type: data
    sellable:
        items:
        - <item[oak_sapling]>
        - <item[spruce_sapling]>
        - <item[birch_sapling]>
        - <item[jungle_sapling]>
        - <item[acacia_sapling]>
        - <item[dark_oak_sapling]>
        - <item[mangrove_propagule]>
        - <item[cherry_sapling]>
        - <item[oak_log]>
        - <item[spruce_log]>
        - null
        - null
        - null
        - null
        - null
        - null
        - null
        - null
        - null
        - null
        - null
        Item_lore:
        -
        -
        - <[lore]>
        - <server.economy.format[<[preis]>]>
        i@oak_sapling:
            sell: 2
        i@spruce_sapling:
            sell: 2
        i@birch_sapling:
            sell: 2
        i@jungle_sapling:
            sell: 2
        i@acacia_sapling:
            sell: 2
        i@dark_oak_sapling:
            sell: 2
        i@mangrove_propagule:
            sell: 2
        i@cherry_sapling:
            sell: 2
        i@oak_log:
            sell: 5
        allowed: <green>[◀ Kaufen]
        disallowed: <red>Nicht genug Geld


Shop_holzfaeller_inventory_Sell:
    type: inventory
    inventory: chest
    title: <gold>Holzfäller:<&sp><green>Verkaufen
    gui: false
    definitions:
      tools: iron_axe[display=<red>Tools]
      blocks: oak_log[display=<red>Logs]
      sell: sunflower[display=<green>Sell;enchantments=sharpness=1;hides=all]
      sapl: oak_sapling[display=<red>Saplings]
      air: black_stained_glass_pane
      verkauf: anvil[display=<red>Verkaufen;lore=<server.economy.format[0]>]
    procedural items:
    - define result <list>
    - determine <[result]>
    slots:
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [tools] [air] [] [] [] [] [] [air]
    - [air] [blocks] [air] [] [] [] [] [] [air]
    - [air] [sapl] [air] [] [] [] [] [] [air]
    - [air] [sell] [air] [] [] [] [] [] [air]
    - [air] [air] [air] [air] [air] [air] [air] [verkauf] [air]

Shop_holzfaeller_inventory_sell_world:
    type: world
    debug: true
    events:
        after player opens Shop_holzfaeller_inventory_sell:
        - flag <player> sell_items:0
        - flag <player> shop
        after player clicks in Shop_holzfaeller_inventory_sell:
        - define money <list[]>
        - foreach <context.inventory.list_contents> as:item:
            - if ( 13|14|15|16|17|22|23|24|25|26|31|32|33|34|35|40|41|42|43|44 contains <[loop_index]> ):
                - if ( <script[Shop_holzfaeller_inventory_sell_data].parsed_key[sellable.items]> contains <[item].simple> ):
                    - define sell <script[Shop_holzfaeller_inventory_sell_data].parsed_key[sellable.<[item].simple>.sell]>
                    - define quantity <[item].quantity>
                    - define all <element[<[sell]>].mul[<[quantity]>]>
                    - define money <[money].insert[<[all]>].at[-1]>
        - flag player sell_value:<[money].sum>
        - if <[money].sum> == 0:
            - inventory adjust d:<context.inventory> slot:53 "display:<red>verkaufen"
            - inventory adjust d:<context.inventory> slot:53 "lore:<server.economy.format[<player.flag[sell_value]>]>"
        - else:
            - inventory adjust d:<context.inventory> slot:53 "display:<green>verkaufen"
            - inventory adjust d:<context.inventory> slot:53 "lore:<server.economy.format[<player.flag[sell_value]>]>"
        on player clicks in Shop_holzfaeller_inventory_sell slot:11|20|29|38|53:
        - if <context.clicked_inventory> == <player.inventory>:
            - determine passively cancelled
        - if <context.clicked_inventory> == <inventory[Shop_holzfaeller_inventory_sell]>:
            - choose <context.slot>:
                - case 11:
                    - inventory open d:Shop_holzfaeller_inventory_tools
                - case 20:
                    - inventory open d:Shop_holzfaeller_inventory_blocks
                - case 29:
                    - inventory open d:Shop_holzfaeller_inventory_Saplings
                - case 38:
                    - inventory open d:Shop_holzfaeller_inventory_Sell
                - case 53:
                    - define sellitems <list[]>
                    - define notsellitems <list[]>
                    - foreach <context.inventory.list_contents> as:item:
                        - if ( 13|14|15|16|17|22|23|24|25|26|31|32|33|34|35|40|41|42|43|44 contains <[loop_index]> ):
                            - if ( <script[Shop_holzfaeller_inventory_sell_data].parsed_key[sellable.items]> contains <[item].simple> ):
                                - define sellitems <[sellitems].insert[<[item]>].at[-1]>
                            - else:
                                - if <[item]> == <item[air]>:
                                    - determine passively cancelled
                                - else:
                                    - define notsellitems <[notsellitems].insert[<[item]>].at[-1]>
                    - narrate <[sellitems]>
                    - narrate <[notsellitems]>
                    - give <[notsellitems]>
                    - flag player <player.flag[Profil]>.economy.money:+:<player.flag[sell_value]>
                    - flag player sell_value:!
                    - inventory set d:<context.inventory> slot:13|14|15|16|17|22|23|24|25|26|31|32|33|34|35|40|41|42|43|44 o:<item[air]>
                    - flag <player> shop:!
                    - inventory open d:Shop_holzfaeller_inventory_Sell
        on player clicks black_stained_glass_pane in Shop_holzfaeller_inventory_sell:
        - determine cancelled
        on player closes Shop_holzfaeller_inventory_sell:
        - define items <list[]>
        - if <player.has_flag[Shop]>:
            - foreach <context.inventory.list_contents> as:item:
                - if ( 13|14|15|16|17|22|23|24|25|26|31|32|33|34|35|40|41|42|43|44 contains <[loop_index]> ):
                    - define items <[items].insert[<[item]>].at[-1]>
            - give <[items]>
            - flag <player> shop:!



