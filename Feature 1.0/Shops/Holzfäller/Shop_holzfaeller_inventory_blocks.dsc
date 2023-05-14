Shop_holzfaeller_inventory_blocks_data:
    type: data
    Blocks:
        Seite_1:
        - oak_log
        - spruce_log
        - birch_log
        - jungle_log
        - acacia_log
        - dark_oak_log
        - mangrove_log
        - cherry_log
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
        oak_log:
            display: Oak Log
            sell: 60
        spruce_log:
            display: Spruce Log
            sell: 60
        birch_log:
            display: Birch Log
            sell: 60
        jungle_log:
            display: Jungle Log
            sell: 60
        acacia_log:
            display: Acacia Log
            sell: 60
        dark_oak_log:
            display: Dark Oak Log
            sell: 60
        mangrove_log:
            display: Mangrove Log
            sell: 60
        cherry_log:
            display: Cherry Log
            sell: 60
        allowed: <green>[◀ Kaufen]
        disallowed: <red>Nicht genug Geld


Shop_holzfaeller_inventory_blocks:
    type: inventory
    inventory: chest
    title: <gold>Holzfäller:<&sp><green>Logs
    gui: true
    definitions:
      tools: iron_axe[display=<red>Tools]
      blocks: oak_log[display=<green>Logs;enchantments=sharpness=1;hides=all]
      sell: sunflower[display=<red>Sell]
      sapl: oak_sapling[display=<red>Saplings]
      air: black_stained_glass_pane
    procedural items:
    - define result <list>
    - foreach <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.Seite_1]> as:i:
        - if ( oak_log|spruce_log|birch_log|jungle_log|acacia_log|dark_oak_log|mangrove_log|cherry_log contains <[i]> ):
            - define preis <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.<[i]>.sell]>
            - if <player.flag[<player.flag[Profil]>.Economy.Money]> >= <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.<[i]>.sell]>:
                - define lore <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.allowed]>
            - if <player.flag[<player.flag[Profil]>.Economy.Money]> < <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.<[i]>.sell]>:
                - define lore <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.disallowed]>
            - define item <[i]>[display=<script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.<[i]>.display]>;lore=<script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.item_lore].separated_by[<&nl>]>;hides=all]
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

Shop_holzfaeller_inventory_blocks_world:
    type: world
    debug: true
    events:
        on player clicks in Shop_holzfaeller_inventory_blocks:
        - choose <context.slot>:
            - case 11:
                - inventory open d:Shop_holzfaeller_inventory_tools
            - case 20:
                - inventory open d:Shop_holzfaeller_inventory_blocks
            - case 29:
                - inventory open d:Shop_holzfaeller_inventory_Saplings
            - case 38:
                - inventory open d:Shop_holzfaeller_inventory_Sell