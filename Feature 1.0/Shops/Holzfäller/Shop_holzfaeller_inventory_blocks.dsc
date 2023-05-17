Shop_holzfaeller_inventory_blocks_data:
    type: data
    Blocks:
        Seite_1:
        - sell_oak_log_1
        - sell_spruce_log_1
        - sell_birch_log_1
        - sell_jungle_log_1
        - sell_acacia_log_1
        - sell_dark_oak_log_1
        - sell_mangrove_log_1
        - sell_cherry_log_1
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
        sell_oak_log_1:
            display: <gold><bold>۞ Oak Log ۞
            sell: 10
        sell_spruce_log_1:
            display: <gold><bold>۞ Spruce Log ۞
            sell: 10
        sell_birch_log_1:
            display: <gold><bold>۞ Birch Log ۞
            sell: 10
        sell_jungle_log_1:
            display: <gold><bold>۞ Jungle Log ۞
            sell: 10
        sell_acacia_log_1:
            display: <gold><bold>۞ Acacia Log ۞
            sell: 10
        sell_dark_oak_log_1:
            display: <gold><bold>۞ Dark Oak Log ۞
            sell: 10
        sell_mangrove_log_1:
            display: <gold><bold>۞ Mangrove Log ۞
            sell: 10
        sell_cherry_log_1:
            display: <gold><bold>۞ Cherry Log ۞
            sell: 10
        allowed: <green>[◀ Kaufen]
        disallowed: <red>Nicht genug Geld


Shop_holzfaeller_inventory_blocks:
    type: inventory
    inventory: chest
    title: <gold>Holzfäller:<&sp><green>Logs
    gui: true
    definitions:
      tools: <item[tools_red]>
      blocks: <item[blocks_green]>
      sell: <item[sell_red]>
      sapl: <item[saplings_red]>
      air: black_stained_glass_pane
    procedural items:
    - define result <list>
    - foreach <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.Seite_1]> as:i:
        - if ( sell_oak_log_1|sell_spruce_log_1|sell_birch_log_1|sell_jungle_log_1|sell_acacia_log_1|sell_dark_oak_log_1|sell_mangrove_log_1|sell_cherry_log_1 contains <[i]> ):
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
        on player clicks sell_oak_log_1 in Shop_holzfaeller_inventory_blocks:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_oak_log_1.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give oak_log_1 quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Oak Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_oak_log_1.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give oak_log_1 quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Oak Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_spruce_log_1 in Shop_holzfaeller_inventory_blocks:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_spruce_log_1.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give spruce_log_1 quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Spruce Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_spruce_log_1.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give spruce_log_1 quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Spruce Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_birch_log_1 in Shop_holzfaeller_inventory_blocks:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_birch_log_1.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give birch_log_1 quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Birch Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_birch_log_1.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give birch_log_1 quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Birch Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_jungle_log_1 in Shop_holzfaeller_inventory_blocks:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_jungle_log_1.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give jungle_log_1 quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Jungle Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_jungle_log_1.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give jungle_log_1 quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Jungle Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_acacia_log_1 in Shop_holzfaeller_inventory_blocks:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_acacia_log_1.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give acacia_log_1 quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Acacia Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_acacia_log_1.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give acacia_log_1 quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Acacia Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_mangrove_log_1 in Shop_holzfaeller_inventory_blocks:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_mangrove_log_1.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give mangrove_log_1 quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Mangrove Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_mangrove_log_1.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give mangrove_log_1 quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Mangrove Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_cherry_log_1 in Shop_holzfaeller_inventory_blocks:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_cherry_log_1.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give cherry_log_1 quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Cherry Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_cherry_log_1.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give cherry_log_1 quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Cherry Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks sell_dark_oak_log_1 in Shop_holzfaeller_inventory_blocks:
        - if <context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_dark_oak_log_1.sell].mul[64]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give dark_oak_log_1 quantity:64
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x64 Dark Oak Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        - if !<context.is_shift_click>:
            - define prize <script[shop_holzfaeller_inventory_blocks_data].parsed_key[blocks.sell_dark_oak_log_1.sell]>
            - if <player.flag[<player.flag[Profil]>.economy.money]> >= <[prize]>:
                - give dark_oak_log_1 quantity:1
                - flag player <player.flag[Profil]>.economy.money:-:<[prize]>
                - narrate "Du hast x1 Dark Oak Logs gekauft für <server.economy.format[<[prize]>]>"
            - else:
                - narrate "Du hast nicht genügend Geld um das zu tun."
        on player clicks black_stained_glass_pane in Shop_holzfaeller_inventory_blocks:
        - determine cancelled
        on player clicks tools_red in Shop_holzfaeller_inventory_blocks:
        - inventory open d:Shop_holzfaeller_inventory_tools
        on player clicks blocks_green in Shop_holzfaeller_inventory_blocks:
        - determine cancelled
        on player clicks saplings_red in Shop_holzfaeller_inventory_blocks:
        - inventory open d:Shop_holzfaeller_inventory_Saplings
        on player clicks sell_red in Shop_holzfaeller_inventory_blocks:
        - inventory open d:Shop_holzfaeller_inventory_Sell