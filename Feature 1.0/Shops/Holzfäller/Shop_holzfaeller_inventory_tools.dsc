Shop_holzfaeller_inventory_tools_data:
    type: data
    Tools:
        Seite_1:
        - sellholzaxt
        - stone_axe
        - iron_axe
        - golden_axe
        - diamond_axe
        - netherite_axe
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
        - null
        - null
        Item_lore:
        -
        - <[desc]>
        - <[min_lvl]>
        -
        - <[lore]>
        - <server.economy.format[<[preis]>]>
        sellholzaxt:
            display: Axt Stufe 1
            sell: 150
            min_lvl: 1
            lore:
            - <white>Eine Holz Axt was soll man damit?
        stone_axe:
            display: Stein Axt
            sell: 300
            min_lvl: 5
            lore:
            - <white>Mit dieser Axt kann man einen Baum fällen.
        iron_axe:
            display: Eisen Axt
            sell: 700
            min_lvl: 10
            lore:
            - <white>Eine robuste Axt aus Eisen.
        golden_axe:
            display: Gold Axt
            sell: 1400
            min_lvl: 15
            lore:
            - <white>Eine Axt zum Angeben.
        diamond_axe:
            display: Diamant Axt
            sell: 2800
            min_lvl: 25
            lore:
            - <white>Diese Axt kann fast alles zerstören.
        netherite_axe:
            display: Netherite Axt
            sell: 5600
            min_lvl: 50
            lore:
            - <white>Das beste was du haben kannst!
        allowed: <green>[◀ Kaufen]
        disallowed: <red>Nicht genug Geld


Shop_holzfaeller_inventory_tools:
    type: inventory
    inventory: chest
    title: <gold>Holzfäller:<&sp><green>Tools
    gui: true
    definitions:
      tools: <item[tools_green]>
      blocks: <item[blocks_red]>
      sapl: <item[saplings_red]>
      sell: <item[sell_red]>
      air: black_stained_glass_pane
    procedural items:
    - define result <list>
    - foreach <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.Seite_1]> as:i:
        - if ( sellholzaxt|stone_axe|iron_axe|golden_axe|diamond_axe|netherite_axe contains <[i]> ):
            - define preis <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.<[i]>.sell]>
            - define desc <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.<[i]>.lore].separated_by[<&nl>]>
            - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.<[i]>.min_lvl]>:
                - define min_lvl <green>✔<&sp>Sammler:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.<[i]>.min_lvl]>
            - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.<[i]>.min_lvl]>:
                - define min_lvl <red>❌<&sp>Sammler:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.<[i]>.min_lvl]>
            - if <player.flag[<player.flag[Profil]>.Economy.Money]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.<[i]>.sell]>:
                - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.allowed]>
            - if <player.flag[<player.flag[Profil]>.Economy.Money]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.<[i]>.sell]>:
                - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.disallowed]>
            - define item <[i]>[display=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.<[i]>.display]>;lore=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.item_lore].separated_by[<&nl>]>;hides=all]
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

Shop_holzfaeller_inventory_tools_world:
    type: world
    debug: true
    events:
        on player clicks sellholzaxt in Shop_holzfaeller_inventory_tools:
        - give <item[holzaxt]>
        - flag <player> <player.flag[Profil]>.economy.money:-:20
        on player clicks black_stained_glass_pane in Shop_holzfaeller_inventory_tools:
        - determine cancelled
        on player clicks tools_green in Shop_holzfaeller_inventory_tools:
        - determine cancelled
        on player clicks blocks_red in Shop_holzfaeller_inventory_tools:
        - inventory open d:Shop_holzfaeller_inventory_blocks
        on player clicks saplings_red in Shop_holzfaeller_inventory_tools:
        - inventory open d:Shop_holzfaeller_inventory_Saplings
        on player clicks sell_red in Shop_holzfaeller_inventory_tools:
        - inventory open d:Shop_holzfaeller_inventory_sell