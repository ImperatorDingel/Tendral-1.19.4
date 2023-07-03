#Große Progressbar gezeichnet in - Symbolen
Long_Progressbar:
  type: procedure
  definitions: XP|MaxXP
  debug: false
  script:
    - define raw <[XP].div[<[MaxXP]>]>
    - define Prozent <[raw].mul[100].format_number[##.##]>
    - define list <list>
    - define zahl 0
    - repeat 20:
        - define zahl <[zahl].add[5]>
        - if <[zahl]> == 100:
          - if <[Prozent]> >= 99:
            - define finish <green>-
            - define list <[list].include[<[finish]>]>
          - else:
            - define finish <white>-
            - define list <[list].include[<[finish]>]>
        - else:
          - if <[Prozent]> >= <[zahl]>:
            - define finish <green>-
            - define list <[list].include[<[finish]>]>
          - else:
            - define finish <white>-
            - define list <[list].include[<[finish]>]>
    - determine <[list].unseparated>
#Kleine Progressbar gezeichnet in | Symbolen
Short_Progressbar:
  type: procedure
  definitions: XP|MaxXP
  debug: false
  script:
    - define raw <[XP].div[<[MaxXP]>]>
    - define Prozent <[raw].mul[100].format_number[##.##]>
    - define list <list>
    - define zahl 0
    - repeat 20:
        - define zahl <[zahl].add[5]>
        - if <[zahl]> == 100:
          - if <[Prozent]> >= 99:
            - define finish <green>&pipe
            - define list <[list].include[<[finish]>]>
          - else:
            - define finish <white>&pipe
            - define list <[list].include[<[finish]>]>
        - else:
          - if <[Prozent]> >= <[zahl]>:
            - define finish <green>&pipe
            - define list <[list].include[<[finish]>]>
          - else:
            - define finish <white>&pipe
            - define list <[list].include[<[finish]>]>
    - determine <[list].unseparated.unescaped>
#Prozent rechner
Prozent_Progressbar:
  type: procedure
  definitions: XP|MaxXP
  debug: false
  script:
    - define raw <[XP].div[<[MaxXP]>].mul[100].format_number[###.##]>
    - determine <[raw]>
