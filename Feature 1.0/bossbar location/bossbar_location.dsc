bossbar_location:
    type: world
    debug: false
    events:
        on delta time secondly:
        - run bossbar_location_task

bossbar_location_task:
    type: task
    debug: false
    script:
    - foreach <server.online_players> as:p:
        - define world <[p].world.name>
        - define biome <[p].location.biome.name>
        - define claim <[p].location.areas.first.note_name.if_null[<empty>]>
        - bossbar MyMessageID players:<[p]> "title:<[world]> - <[biome]> - <[claim]>" progress:0