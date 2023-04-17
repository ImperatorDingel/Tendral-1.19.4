Shop_holzfaeller_inventory_sell_data:
    type: data
    sellable:
        items:
        - i@oak_sapling
        - i@spruce_sapling
        - i@birch_sapling
        - i@jungle_sapling
        - i@acacia_sapling
        - i@dark_oak_sapling
        - i@mangrove_propagule
        - i@cherry_sapling
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
        - null
        - null
        Item_lore:
        -
        -
        - <[lore]>
        - <server.economy.format[<[preis]>]>
        oak_sapling:
            display: Oak Log
            sell: 60
        spruce_sapling:
            display: Spruce Log
            sell: 60
        birch_sapling:
            display: Birch Log
            sell: 60
        jungle_sapling:
            display: Jungle Log
            sell: 60
        acacia_sapling:
            display: Acacia Log
            sell: 60
        dark_oak_sapling:
            display: Dark Oak Log
            sell: 60
        mangrove_propagule:
            display: Mangrove Log
            sell: 60
        cherry_sapling:
            display: Cherry Log
            sell: 60
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
      sell: sunflower[display=<green>Sell]
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
        after player right clicks chipped_anvil:
        - determine passively cancelled
        - inventory open d:Shop_holzfaeller_inventory_sell
        
        after player opens Shop_holzfaeller_inventory_sell:
        - flag <player> sell_items:0
        
        after player clicks in Shop_holzfaeller_inventory_sell:
        - define inv <inventory[shop_holzfaeller_inventory_sell]>
        - define money <list[]>
        - foreach <context.inventory.list_contents> as:item:
            - if ( 13|14|15|16|17|22|23|24|25|26|31|32|33|34|35|40|41|42|43|44 contains <[loop_index]> ):
                - if ( <[item].simple> contains <item[oak_log]> ):
                    - define sell 20
                    - define quantity <[item].quantity>
                    - define all <element[<[sell]>].mul[<[quantity]>]>
                    - define money <[money].insert[<[all]>].at[-1]>
        - flag player sell_value:<[money].sum>
        - inventory adjust d:<context.inventory> slot:53 "lore:<server.economy.format[<player.flag[sell_value]>]>"


