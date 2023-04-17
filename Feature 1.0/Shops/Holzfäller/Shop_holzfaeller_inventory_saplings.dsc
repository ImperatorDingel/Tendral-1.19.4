Shop_holzfaeller_inventory_Saplings_data:
    type: data
    Saplings:
        Seite_1:
        - oak_sapling
        - spruce_sapling
        - birch_sapling
        - jungle_sapling
        - acacia_sapling
        - dark_oak_sapling
        - mangrove_propagule
        - cherry_sapling
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


Shop_holzfaeller_inventory_Saplings:
    type: inventory
    inventory: chest
    title: <gold>Holzfäller:<&sp><green>Saplings
    gui: true
    definitions:
      tools: iron_axe[display=<red>Tools]
      blocks: oak_log[display=<red>Logs]
      sell: sunflower[display=<green>Sell]
      sapl: oak_sapling[display=<red>Saplings]
      air: black_stained_glass_pane
    procedural items:
    - define result <list>
    - foreach <script[shop_holzfaeller_inventory_saplings_data].parsed_key[saplings.Seite_1]> as:i:
        - if ( oak_sapling|spruce_sapling|birch_sapling|jungle_sapling|acacia_sapling|dark_oak_sapling|mangrove_propagule|cherry_sapling contains <[i]> ):
            - define preis <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.<[i]>.sell]>
            - if <player.flag[<player.flag[Profil]>.Economy.Money]> >= <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.<[i]>.sell]>:
                - define lore <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.allowed]>
            - if <player.flag[<player.flag[Profil]>.Economy.Money]> < <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.<[i]>.sell]>:
                - define lore <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.disallowed]>
            - define item <[i]>[display=<script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.<[i]>.display]>;lore=<script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.item_lore].separated_by[<&nl>]>;hides=all]
        - if <[i]> == null:
            - define item air
        - define result <[result].include[<[item]>]>
    - determine <[result]>
    slots:
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [tools] [air] [] [] [] [] [] [air]
    - [air] [blocks] [air] [] [] [] [] [] [air]
    - [air] [sapl] [air] [] [] [] [] [] [air]
    - [air] [sell] [air] [] [] [] [] [] [air]
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]