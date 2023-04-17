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
      sapl: oak_sapling[display=<red>Saplings]
      air: black_stained_glass_pane
    slots:
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [tools] [air] [] [] [] [] [] [air]
    - [air] [blocks] [air] [] [] [] [] [] [air]
    - [air] [sapl] [air] [] [] [] [] [] [air]
    - [air] [sell] [air] [] [] [] [] [] [air]
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]



