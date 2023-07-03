Shop_farmer:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - Shop_farmer_interact

Shop_farmer_interact:
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
                - inventory open d:Shop_farmer_inventory
                - zap *


Shop_farmer_inventory:
    type: inventory
    inventory: chest
    title: <gold>Farmer
    gui: true
    definitions:
      tools: iron_hoe[display=<red>Tools]
      blocks: wheat[display=<red>Crops]
      sell: sunflower[display=<red>Sell]
      sapl: wheat_seeds[display=<red>Seeds]
      air: black_stained_glass_pane
    slots:
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [tools] [air] [] [] [] [] [] [air]
    - [air] [blocks] [air] [] [] [] [] [] [air]
    - [air] [sapl] [air] [] [] [] [] [] [air]
    - [air] [sell] [air] [] [] [] [] [] [air]
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]

Shop_farmer_inventory_world:
    type: world
    debug: true
    events:
        on player clicks in Shop_farmer_inventory:
        - choose <context.slot>:
            - case 11:
                - inventory open d:Shop_farmer_inventory_tools
            - case 20:
                - inventory open d:Shop_farmer_inventory_blocks
            - case 29:
                - inventory open d:Shop_farmer_inventory_Saplings
            - case 38:
                - inventory open d:Shop_farmer_inventory_Sell