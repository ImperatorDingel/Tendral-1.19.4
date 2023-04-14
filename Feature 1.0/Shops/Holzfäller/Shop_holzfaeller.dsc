Shop_holzfaeller:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - Shop_holzfaeller_interact

Shop_holzfaeller_interact:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - narrate "Hallo <player.name>, wie kann ich helfen ?"
                - wait 2s
                - narrate "Du möchtest etwas kaufen? nur zu."
                - zap 2
        2:
            click trigger:
                script:
                - inventory open d:Shop_holzfaeller_inventory
                - zap *


Shop_holzfaeller_inventory:
    type: inventory
    inventory: chest
    title: <gold>Holzfäller
    gui: true
    definitions:
      tools: iron_axe[display=<red>Tools]
      blocks: oak_log[display=<red>Logs]
      sell: sunflower[display=<red>Sell]
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [tools] [] [] [] [] [] [] []
    - [] [blocks] [] [] [] [] [] [] []
    - [] [sell] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

Shop_holzfaeller_inventory_tools_data:
    type: data
    Tools:
        Seite_1:
        - wooden_axe
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
        wooden_axe:
            display: Gute Axt
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
        gold_axe:
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
        allowed: <green>[< Kaufen]
        disallowed: <red>Nicht genug Geld


Shop_holzfaeller_inventory_tools:
    type: inventory
    inventory: chest
    title: <gold>Holzfäller:<&sp><green>Tools
    gui: true
    definitions:
      tools: iron_axe[display=<green>Tools]
      blocks: oak_log[display=<red>Logs]
      sell: sunflower[display=<red>Sell]
      axe_1: wooden_axe
      axe 2: stone_axe
      axe_3: iron_axe
      axe_4: gold_axe
      axe_5: diamond_axe
      axe_6: netherite_axe
    procedural items:
    - define result <list>
    - foreach <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.Seite_1]> as:i:
        - choose <[i]>:
            - case wooden_axe:
                - define preis <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.wooden_axe.sell]>
                - define desc <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.wooden_axe.lore].separated_by[<&nl>]>
                - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.wooden_axe.min_lvl]>:
                    - define min_lvl <green>✔<&sp>min<&sp>lvl:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.wooden_axe.min_lvl]>
                - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.wooden_axe.min_lvl]>:
                    - define min_lvl <red>❌<&sp>Sammler:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.wooden_axe.min_lvl]>
                - if <player.flag[<player.flag[Profil]>.Economy.Money]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.wooden_axe.sell]>:
                    - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.allowed]>
                - if <player.flag[<player.flag[Profil]>.Economy.Money]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.wooden_axe.sell]>:
                    - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.disallowed]>
                - define item wooden_axe[display=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.wooden_axe.display]>;lore=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.item_lore].separated_by[<&nl>]>;hides=all]
            - case stone_axe:
                - define preis <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.stone_axe.sell]>
                - define desc <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.stone_axe.lore].separated_by[<&nl>]>
                - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.stone_axe.min_lvl]>:
                    - define min_lvl <green>✔<&sp>min<&sp>lvl:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.stone_axe.min_lvl]>
                - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.stone_axe.min_lvl]>:
                    - define min_lvl <red>❌<&sp>Sammler:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.stone_axe.min_lvl]>
                - if <player.flag[<player.flag[Profil]>.Economy.Money]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.stone_axe.sell]>:
                    - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.allowed]>
                - if <player.flag[<player.flag[Profil]>.Economy.Money]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.stone_axe.sell]>:
                    - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.disallowed]>
                - define item stone_axe[display=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.stone_axe.display]>;lore=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.item_lore].separated_by[<&nl>]>;hides=all]
            - case iron_axe:
                - define preis <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.iron_axe.sell]>
                - define desc <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.iron_axe.lore].separated_by[<&nl>]>
                - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.iron_axe.min_lvl]>:
                    - define min_lvl <green>✔<&sp>min<&sp>lvl:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.iron_axe.min_lvl]>
                - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.iron_axe.min_lvl]>:
                    - define min_lvl <red>❌<&sp>Sammler:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.iron_axe.min_lvl]>
                - if <player.flag[<player.flag[Profil]>.Economy.Money]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.iron_axe.sell]>:
                    - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.allowed]>
                - if <player.flag[<player.flag[Profil]>.Economy.Money]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.iron_axe.sell]>:
                    - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.disallowed]>
                - define item iron_axe[display=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.iron_axe.display]>;lore=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.item_lore].separated_by[<&nl>]>;hides=all]
            - case golden_axe:
                - define preis <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.gold_axe.sell]>
                - define desc <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.gold_axe.lore].separated_by[<&nl>]>
                - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.gold_axe.min_lvl]>:
                    - define min_lvl <green>✔<&sp>min<&sp>lvl:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.gold_axe.min_lvl]>
                - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.gold_axe.min_lvl]>:
                    - define min_lvl <red>❌<&sp>Sammler:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.gold_axe.min_lvl]>
                - if <player.flag[<player.flag[Profil]>.Economy.Money]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.gold_axe.sell]>:
                    - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.allowed]>
                - if <player.flag[<player.flag[Profil]>.Economy.Money]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.gold_axe.sell]>:
                    - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.disallowed]>
                - define item golden_axe[display=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.gold_axe.display]>;lore=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.item_lore].separated_by[<&nl>]>;hides=all]
            - case diamond_axe:
                - define preis <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.diamond_axe.sell]>
                - define desc <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.diamond_axe.lore].separated_by[<&nl>]>
                - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.diamond_axe.min_lvl]>:
                    - define min_lvl <green>✔<&sp>min<&sp>lvl:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.diamond_axe.min_lvl]>
                - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.diamond_axe.min_lvl]>:
                    - define min_lvl <red>❌<&sp>Sammler:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.diamond_axe.min_lvl]>
                - if <player.flag[<player.flag[Profil]>.Economy.Money]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.diamond_axe.sell]>:
                    - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.allowed]>
                - if <player.flag[<player.flag[Profil]>.Economy.Money]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.diamond_axe.sell]>:
                    - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.disallowed]>
                - define item diamond_axe[display=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.diamond_axe.display]>;lore=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.item_lore].separated_by[<&nl>]>;hides=all]
            - case netherite_axe:
                - define preis <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.netherite_axe.sell]>
                - define desc <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.netherite_axe.lore].separated_by[<&nl>]>
                - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.netherite_axe.min_lvl]>:
                    - define min_lvl <green>✔<&sp>min<&sp>lvl:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.netherite_axe.min_lvl]>
                - if <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.netherite_axe.min_lvl]>:
                    - define min_lvl <red>❌<&sp>Sammler:<&sp><script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.netherite_axe.min_lvl]>
                - if <player.flag[<player.flag[Profil]>.Economy.Money]> >= <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.netherite_axe.sell]>:
                    - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.allowed]>
                - if <player.flag[<player.flag[Profil]>.Economy.Money]> < <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.netherite_axe.sell]>:
                    - define lore <script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.disallowed]>
                - define item netherite_axe[display=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.netherite_axe.display]>;lore=<script[shop_holzfaeller_inventory_tools_data].parsed_key[tools.item_lore].separated_by[<&nl>]>;hides=all]
            - case null:
                - define item air
        - define result <[result].include[<[item]>]>
    - determine <[result]>
    slots:
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [tools] [air] [] [] [] [] [] [air]
    - [air] [blocks] [air] [] [] [] [] [] [air]
    - [air] [sell] [air] [] [] [] [] [] [air]
    - [air] [air] [air] [] [] [] [] [] [air]
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
