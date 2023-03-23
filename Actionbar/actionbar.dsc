Actionbar:
    type: world
    events:
        after delta time secondly:
        - run actionbartask

actionbartask:
    type: task
    script:
    - define Leben <player.flag[<player.flag[Profil]>.Stats.Leben]>
    - define Mana <player.flag[<player.flag[Profil]>.Stats.Mana]>
    - define Max_Mana <player.flag[<player.flag[Profil]>.Stats.ManaMax]>
    - define actionbar "H:<[Leben]> - M:<[Mana]>/<[Max_Mana]>"
    - foreach <server.online_players_flagged[Profil]>:
        - actionbar "<player.flag[<player.flag[Profil]>.Stats.Leben]>" per_player