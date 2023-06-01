English_Foraging:
  type: data
  Foraging_0: Foraging 0
  Foraging_1: Foraging I
  Foraging_2: Foraging II
  Foraging_3: Foraging III
  Foraging_4: Foraging IV
  Foraging_5: Foraging V
  Foraging_6: Foraging VI
  Foraging_7: Foraging VII
  Foraging_8: Foraging VIII
  Foraging_9: Foraging IX
  Foraging_10: Foraging X
  Foraging_11: Foraging XI
  Foraging_12: Foraging XII
  Foraging_13: Foraging XIII
  Foraging_14: Foraging XIV
  Foraging_15: Foraging XV
  Foraging_16: Foraging XVI
  Foraging_17: Foraging XVII
  Foraging_18: Foraging XVIII
  Foraging_19: Foraging XIX
  Foraging_20: Foraging XX
  Foraging_max: 20
  Foraging_red: Erreiche für die nächsten Stufen erst
  Foraging_stats: ❈ Mana +1

German_Foraging:
  type: data
  Foraging_0: Sammler 0
  Foraging_1: Sammler I
  Foraging_2: Sammler II
  Foraging_3: Sammler III
  Foraging_4: Sammler IV
  Foraging_5: Sammler V
  Foraging_6: Sammler VI
  Foraging_7: Sammler VII
  Foraging_8: Sammler VIII
  Foraging_9: Sammler IX
  Foraging_10: Sammler X
  Foraging_11: Sammler XI
  Foraging_12: Sammler XII
  Foraging_13: Sammler XIII
  Foraging_14: Sammler XIV
  Foraging_15: Sammler XV
  Foraging_16: Sammler XVI
  Foraging_17: Sammler XVII
  Foraging_18: Sammler XVIII
  Foraging_19: Sammler XIX
  Foraging_20: Sammler XX
  Foraging_max: 20
  Foraging_red: Erreiche für die nächsten Stufen erst
  Foraging_stats: ❈ Mana +1

Foraging_LevelUp:
  type: data
  LevelUp:
      - <green><strikethrough>---------------------------------------------------
      - <green>Skill Level erhöht
      - <reset><green><[oldlevel1]> -> <[newlevel1]>
      - <green><strikethrough>---------------------------------------------------

ForagingLevel_world:
  type: world
  debug: false
  events:
    after player joins:
    - inject ForagingLevel
    - run ForagingXPBar
    after player quits:
    - inject ForagingLevel
    after delta time secondly every:1:
    - inject ForagingLevel
    after delta time minutely every:1:
    - run ForagingXPBar

ForagingLevel:
    type: task
    debug: false
    script:
      - stop if:<server.online_players.is_empty>
      - foreach <server.online_players_flagged[Profil]> as:p:
        - define exp <[p].flag[<[p].flag[Profil]>.Skills.Foraging.Exp]>
        - define exptarget <[p].flag[<[p].flag[Profil]>.Skills.Foraging.Target]>
        - if <[Exp]> >= <[exptarget]>:
          - flag <[p]> <[p].flag[Profil]>.Skills.Foraging.Level:++
          - flag <[p]> <[p].flag[Profil]>.Skills.Foraging.Exp:-:<[p].flag[<[p].flag[Profil]>.Skills.Foraging.Target]>
          - flag <[p]> <[p].flag[Profil]>.Skills.Foraging.Target:*:1.25
          - flag <[p]> <[p].flag[Profil]>.Skills.Foraging.MaxDrop:++
          - flag <[p]> <[p].flag[Profil]>.Stats.ManaMax:++
          - define newlevel <[p].flag[<[p].flag[profil]>.Skills.Foraging.Level]>
          - define oldlevel <[newlevel].sub[1]>
          - define newlevel1 <script[German_Foraging].data_key[Foraging_<[newlevel]>]>
          - define oldlevel1 <script[German_Foraging].data_key[Foraging_<[oldlevel]>]>
          - narrate targets:<[p]> <script[Foraging_LevelUp].parsed_key[LevelUp].separated_by[<&nl>]> per_player
          - toast "Foraging <[newlevel1]>" icon:iron_axe targets:<[p]>
          - playsound <[p]> sound:ENTITY_PLAYER_LEVELUP volume:1.0 pitch:0.6

ForagingXPBar:
    type: task
    debug: false
    script:
    - foreach <server.online_players_flagged[Profil]> as:p:
        - define list <list>
        - define zahl 0
        - define exp <[p].flag[<[p].flag[Profil]>.Skills.Foraging.Exp]>
        - define exptarget <[p].flag[<[p].flag[Profil]>.Skills.Foraging.Target]>
        - define raw <[exp].div[<[exptarget]>]>
        - define Prozent <[raw].mul[100].format_number[##.##]>
        - flag <[p]> <[p].flag[Profil]>.ExpProzent.ForagingProzent:<[Prozent]>
        - repeat 20:
          - define zahl <[zahl].add[5]>
          - if <[zahl]> == 100:
            - if <[p].flag[<[p].flag[Profil]>.ExpProzent.ForagingProzent]> >= 99:
              - define finish <green>-
              - define list <[list].include[<[finish]>]>
            - else:
              - define finish <white>-
              - define list <[list].include[<[finish]>]>
          - else:
            - if <[p].flag[<[p].flag[Profil]>.ExpProzent.ForagingProzent]> >= <[zahl]>:
              - define finish <green>-
              - define list <[list].include[<[finish]>]>
            - else:
              - define finish <white>-
              - define list <[list].include[<[finish]>]>
          - flag <[p]> <[p].flag[Profil]>.ExpBar.Foraging:<[list].unseparated>