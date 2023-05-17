Shop_holzfaeller_inventory_Saplings_data:
    type: data
    Saplings:
        Seite_1:
        - sell_oak_sapling
        - sell_spruce_sapling
        - sell_birch_sapling
        - sell_jungle_sapling
        - sell_acacia_sapling
        - sell_dark_oak_sapling
        - sell_mangrove_propagule
        - sell_cherry_sapling
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
        sell_oak_sapling:
            display: <gold><bold>۞ Oak Sapling ۞
            sell: 20
        sell_spruce_sapling:
            display: <gold><bold>۞ Spruce Sapling ۞
            sell: 20
        sell_birch_sapling:
            display: <gold><bold>۞ Birch Sapling ۞
            sell: 20
        sell_jungle_sapling:
            display: <gold><bold>۞ Jungle Sapling ۞
            sell: 20
        sell_acacia_sapling:
            display: <gold><bold>۞ Acacia Sapling ۞
            sell: 20
        sell_dark_oak_sapling:
            display: <gold><bold>۞ Dark Oak Sapling ۞
            sell: 20
        sell_mangrove_propagule:
            display: <gold><bold>۞ Mangrove Sapling ۞
            sell: 20
        sell_cherry_sapling:
            display: <gold><bold>۞ Cherry Sapling ۞
            sell: 20
        allowed: <green>[◀ Kaufen]
        disallowed: <red>Nicht genug Geld


Shop_holzfaeller_inventory_Saplings:
    type: inventory
    inventory: chest
    title: <gold>Holzfäller:<&sp><green>Saplings
    gui: true
    definitions:
      tools: <item[tools_red]>
      blocks: <item[blocks_red]>
      sell: <item[sell_red]>
      sapl: <item[saplings_green]>
      air: black_stained_glass_pane
    procedural items:
    - define result <list>
    - foreach <script[shop_holzfaeller_inventory_saplings_data].parsed_key[saplings.Seite_1]> as:i:
        - if ( sell_oak_sapling|sell_spruce_sapling|sell_birch_sapling|sell_jungle_sapling|sell_acacia_sapling|sell_dark_oak_sapling|sell_mangrove_propagule|sell_cherry_sapling contains <[i]> ):
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

Shop_holzfaeller_inventory_saplings_world:
    type: world
    debug: true
    events:
        on player clicks black_stained_glass_pane in Shop_holzfaeller_inventory_Saplings:
        - determine cancelled
        on player clicks tools_red in Shop_holzfaeller_inventory_Saplings:
        - inventory open d:Shop_holzfaeller_inventory_tools
        on player clicks blocks_red in Shop_holzfaeller_inventory_Saplings:
        - inventory open d:Shop_holzfaeller_inventory_blocks
        on player clicks saplings_green in Shop_holzfaeller_inventory_Saplings:
        - determine cancelled
        on player clicks sell_red in Shop_holzfaeller_inventory_Saplings:
        - inventory open d:Shop_holzfaeller_inventory_sell
        on player clicks sell_oak_sapling in Shop_holzfaeller_inventory_Saplings:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_oak_sapling.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give oak_sapling quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Oak Saplings gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_oak_sapling.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give oak_sapling quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Oak Saplings gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_birch_sapling in Shop_holzfaeller_inventory_Saplings:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_birch_sapling.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give birch_sapling quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Birch Saplings gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_birch_sapling.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give birch_sapling quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Birch Saplings gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_spruce_sapling in Shop_holzfaeller_inventory_Saplings:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_spruce_sapling.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give spruce_sapling quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Spruce Saplings gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_spruce_sapling.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give spruce_sapling quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Spruce Saplings gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_jungle_sapling in Shop_holzfaeller_inventory_Saplings:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_jungle_sapling.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give jungle_sapling quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Jungle Saplings gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_jungle_sapling.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give jungle_sapling quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Jungle Saplings gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_acacia_sapling in Shop_holzfaeller_inventory_Saplings:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_acacia_sapling.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give acacia_sapling quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Acacia Saplings gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_acacia_sapling.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give acacia_sapling quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Acacia Saplings gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_dark_oak_sapling in Shop_holzfaeller_inventory_Saplings:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_dark_oak_sapling.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give dark_oak_sapling quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Dark Oak Saplings gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_dark_oak_sapling.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give dark_oak_sapling quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Dark Oak Saplings gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_mangrove_propagule in Shop_holzfaeller_inventory_Saplings:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_mangrove_propagule.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give mangrove_propagule quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Mangrove Propagule gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_mangrove_propagule.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give mangrove_propagule quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Mangrove Propagule gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_cherry_sapling in Shop_holzfaeller_inventory_Saplings:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_cherry_sapling.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give cherry_sapling quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Cherry Sapling gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_Saplings_data].parsed_key[Saplings.sell_cherry_sapling.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give cherry_sapling quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Cherry Sapling gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."