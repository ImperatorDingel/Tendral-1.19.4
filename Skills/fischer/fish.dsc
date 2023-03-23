FishingFarm:
    type: world
    events:
        on player fishes while CAUGHT_FISH:
        # Level Random
        - define lvl <util.random.int[1].to[<player.flag[<player.flag[Profil]>.Skills.Fishing.Level].add[2]>]>
        # Base Fischgröße
        - define basesize 20
        # Fischgröße
        - define fishsize <[lvl].mul[5]>
        # Fischgröße Base + Levelgröße
        - define fishsizelevel <[basesize].add[<[fishsize]>]>
        # Fischnamen gebung
        - if <context.item> == <item[cod]>:
            # TODO: Item Scripts für Fische
            - random:
                - define name Karpfen
                - define name Flussbarsch
                - define name Zander
                - define name Hecht
                - define name Waller
                - define name Forelle
                - define name Aal
                - define name Wels
                - define name Regenbogenforelle
        - if <context.item> == <item[salmon]>:
            - random:
                - define name Seelachs
                - define name Wildlachs
        - if <context.item> == <item[tropical_fish]>:
            - random:
                - define name Nemo
                - define name Clownfisch
                - define name DingelFisch
        - if <context.item> == <item[pufferfish]>:
            - define name Kugelfisch
        # Chance berechnung + Rarität des Fisches
        - define chance <util.random.int[1].to[100]>
        - if <[chance]> < 50:
            - define rare <empty>
        - if <[chance]> >= 50:
            - define rare <gold><bold>[<gold>★<bold>]<&sp>
            - define fishsize <[fishsize].add[2]>
        - if <[chance]> >= 75:
            - define rare <gold><bold>[<gray>★★<gold><bold>]<&sp>
            - define fishsize <[fishsize].add[4]>
        - if <[chance]> >= 95:
            - define rare <gold><bold>[<yellow>★★★<gold><bold>]<&sp>
            - define fishsize <[fishsize].add[15]>
        # Xp beim fangen
        - define xp <[lvl].add[<[fishsizelevel]>].mul[1]>
        # Base Gewicht
        - define baseweight 15
        # Gewicht berechnung
        - define weight <[fishsize].mul[30]>
        # Gewicht berechnung mit Base + Level
        - define weightlevel <[baseweight].add[<[weight]>]>
        # Preis berechnung Gewicht * 1
        - define prize <[weightlevel].mul[1]>
        # Map
        - definemap Info:
            display_name: "<gold><bold>۞ <[name]> <[rare]><gold><bold>۞"
            lore:
            - "<gold><bold>۞ Level: <[lvl]> "
            - "<gold><bold>۞ Größe: <proc[metric_number3].context[<[fishsizelevel]>]> "
            - "<gold><bold>۞ Gewicht: <proc[metric_number2].context[<[weightlevel]>]> "
            - "<gold><bold>۞"
            - "<gold><bold>۞ Preis:"
            - "<gold><bold>۞ <[prize].proc[Economy_Tendral_proc2]>"
        - if <item[cod]>||<item[salmon]>||<item[tropical_fish]>||<item[pufferfish]> contains <context.item>:
            - define item <context.item.with_map[<[Info]>].with_flag[Preis:<[prize]>]>
            - determine passively caught:<[item]>
            - flag <player> <player.flag[Profil]>.Skills.Fishing.Exp:+:<[xp]>
            - actionbar "Fishing +<[xp]> Exp " targets:<player>
            - toast "Fishing +<[xp]> Exp" icon:fishing_rod targets:<player>
        - else:
            - determine caught:<context.item>

#Gramm zu Kilogramm Metric
metric_number2:
    type: procedure
    debug: false
    data:
        1000: kg
    definitions: number
    script:
    - define length <[number].abs.log[10].round>
    - foreach <script.data_key[data]> key:div as:suffix:
        - if <[length]> >= <[div].length.sub[1]>:
            - determine <[number].div[<[div]>].round_to[2]><[suffix]>
    - determine <[number].div[1000].round_to[2]>kg
#Cm -> M umrechnung Metric
metric_number3:
    type: procedure
    debug: false
    data:
        100: m
    definitions: number
    script:
    - define length <[number].abs.log[10].round>
    - if <[number]> >= 100:
        - foreach <script.data_key[data]> key:div as:suffix:
            - if <[length]> >= <[div].length.sub[1]>:
                - determine <[number].div[<[div]>].round_to[2]><&sp><[suffix]>
    - else:
        - define suffix cm
        - determine <[number].round><&sp><[suffix]>
    - determine <[number]>
