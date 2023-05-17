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
        - <item[oak_log_1].simple>
        - <item[oak_log_2].simple>
        - <item[oak_log_3].simple>
        - <item[oak_log_4].simple>
        - <item[spruce_log_1].simple>
        - <item[spruce_log_2].simple>
        - <item[spruce_log_3].simple>
        - <item[spruce_log_4].simple>
        - <item[birch_log_1].simple>
        - <item[birch_log_2].simple>
        - <item[birch_log_3].simple>
        - <item[birch_log_4].simple>
        - <item[jungle_log_1].simple>
        - <item[jungle_log_2].simple>
        - <item[jungle_log_3].simple>
        - <item[jungle_log_4].simple>
        - <item[acacia_log_1].simple>
        - <item[acacia_log_2].simple>
        - <item[acacia_log_3].simple>
        - <item[acacia_log_4].simple>
        - <item[dark_oak_log_1].simple>
        - <item[dark_oak_log_2].simple>
        - <item[dark_oak_log_3].simple>
        - <item[dark_oak_log_4].simple>
        - <item[mangrove_log_1].simple>
        - <item[mangrove_log_2].simple>
        - <item[mangrove_log_3].simple>
        - <item[mangrove_log_4].simple>
        - <item[cherry_log_1].simple>
        - <item[cherry_log_2].simple>
        - <item[cherry_log_3].simple>
        - <item[cherry_log_4].simple>
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
        i@oak_log_1:
            sell: 2
        i@oak_log_2:
            sell: 7
        i@oak_log_3:
            sell: 9
        i@oak_log_4:
            sell: 11
        i@spruce_log_1:
            sell: 2
        i@spruce_log_2:
            sell: 7
        i@spruce_log_3:
            sell: 9
        i@spruce_log_4:
            sell: 11
        i@birch_log_1:
            sell: 2
        i@birch_log_2:
            sell: 7
        i@birch_log_3:
            sell: 9
        i@birch_log_4:
            sell: 11
        i@dark_oak_log_1:
            sell: 2
        i@dark_oak_log_2:
            sell: 7
        i@dark_oak_log_3:
            sell: 9
        i@dark_oak_log_4:
            sell: 11
        i@jungle_log_1:
            sell: 2
        i@jungle_log_2:
            sell: 7
        i@jungle_log_3:
            sell: 9
        i@jungle_log_4:
            sell: 11
        i@acacia_log_1:
            sell: 2
        i@acacia_log_2:
            sell: 7
        i@acacia_log_3:
            sell: 9
        i@acacia_log_4:
            sell: 11
        i@mangrove_log_1:
            sell: 2
        i@mangrove_log_2:
            sell: 7
        i@mangrove_log_3:
            sell: 9
        i@mangrove_log_4:
            sell: 11
        i@cherry_log_1:
            sell: 2
        i@cherry_log_2:
            sell: 7
        i@cherry_log_3:
            sell: 9
        i@cherry_log_4:
            sell: 11
        allowed: <green>[◀ Kaufen]
        disallowed: <red>Nicht genug Geld


Shop_holzfaeller_inventory_Sell:
    type: inventory
    inventory: chest
    title: <gold>Holzfäller:<&sp><green>Verkaufen
    gui: false
    definitions:
      tools: <item[tools_red]>
      blocks: <item[blocks_red]>
      sell: <item[sell_green]>
      sapl: <item[saplings_red]>
      air: black_stained_glass_pane
      verkauf: <item[sellconfirm]>]
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
        on player clicks sellconfirm in Shop_holzfaeller_inventory_sell:
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
                - narrate "Du hast <server.economy.format[<player.flag[sell_value]>]> gekriegt."
                - give <[notsellitems]>
                - flag player <player.flag[Profil]>.economy.money:+:<player.flag[sell_value]>
                - flag player sell_value:!
                - inventory set d:<context.inventory> slot:13|14|15|16|17|22|23|24|25|26|31|32|33|34|35|40|41|42|43|44 o:<item[air]>
                - flag <player> shop:!
                - inventory open d:Shop_holzfaeller_inventory_Sell
        on player clicks black_stained_glass_pane in Shop_holzfaeller_inventory_sell:
        - determine cancelled
        on player clicks tools_red in Shop_holzfaeller_inventory_sell:
        - inventory open d:Shop_holzfaeller_inventory_tools
        on player clicks blocks_red in Shop_holzfaeller_inventory_sell:
        - inventory open d:Shop_holzfaeller_inventory_blocks
        on player clicks saplings_red in Shop_holzfaeller_inventory_sell:
        - inventory open d:Shop_holzfaeller_inventory_Saplings
        on player clicks sell_green in Shop_holzfaeller_inventory_sell:
        - determine cancelled
        on player closes Shop_holzfaeller_inventory_sell:
        - define items <list[]>
        - if <player.has_flag[Shop]>:
            - foreach <context.inventory.list_contents> as:item:
                - if ( 13|14|15|16|17|22|23|24|25|26|31|32|33|34|35|40|41|42|43|44 contains <[loop_index]> ):
                    - define items <[items].insert[<[item]>].at[-1]>
            - give <[items]>
            - flag <player> shop:!
