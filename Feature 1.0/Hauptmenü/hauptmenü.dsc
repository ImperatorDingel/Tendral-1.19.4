Hauptmenue_inventory:
    type: inventory
    inventory: chest
    gui: true
    debug: false
    definitions:
        p: black_stained_glass_pane[display_name=<gold><bold>۞ Profil ۞;lore=<script[Menu_Data].parsed_key[Profil].separated_by[<&nl>]>]
        f: green_stained_glass_pane[display_name=<gold><bold>۞ Freunde ۞;lore=<red><bold>Coming Soon]
        g: lime_stained_glass_pane[display_name=<gold><bold>۞ Gilde ۞;lore=<red><bold>Coming Soon]
        s: gray_stained_glass_pane[display_name=<gold><bold>۞ Geld ۞]
        Pro: purple_stained_glass_pane[display_name=<gold><bold>۞ Handwerk ۞;lore=<script[Menu_Data].parsed_key[Professions].separated_by[<&nl>]>]
        Ski: magenta_stained_glass_pane[display_name=<gold><bold>۞ Skills ۞;lore=<script[Menu_Data].parsed_key[Skills].separated_by[<&nl>]>]
        w: brown_stained_glass_pane[display_name=<gold><bold>۞ Home ۞]
        SR: brown_stained_glass_pane[display_name=<gold><bold>۞ Schnellreise ۞]
        PW: red_stained_glass_pane[display_name=<gold><bold>۞ Profil wechseln ۞]
    slots:
    - [air] [air] [air] [air] [p] [air] [air] [air] [air]
    - [air] [air] [air] [Ski] [air] [f] [air] [air] [air]
    - [air] [air] [Pro] [air] [w] [air] [g] [air] [air]
    - [air] [air] [air] [SR] [air] [s] [air] [air] [air]
    - [air] [air] [air] [air] [PW] [air] [air] [air] [air]