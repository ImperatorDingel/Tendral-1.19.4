Actionbar_world:
    type: world
    debug: false
    events:
        after delta time secondly:
        - run actionbartask

actionbartask:
    type: task
    debug: false
    script:
    - actionbar "H:<player.health.round>/<player.flag[<player.flag[Profil]>.Stats.Leben]> - M:<player.flag[<player.flag[Profil]>.Stats.Mana]>/<player.flag[<player.flag[Profil]>.Stats.ManaMax]>" per_player targets:<server.online_players_flagged[Profil]>