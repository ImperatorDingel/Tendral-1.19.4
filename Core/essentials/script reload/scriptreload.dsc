scriptreload:
    type: world
    events:
        after script reload:
        - stop if:<server.online_players.is_empty>
        - foreach <server.online_players>:
            - if <[value].is_op>:
                - define Admin:->:<[value]>
        - narrate "<green><bold>Scripts wurden neu geladen." targets:<[Admin]>
        - adjust server save
        - announce to_console "<green><bold>Scripts wurden neu geladen."

AutoSave:
    type: world
    events:
        after delta time minutely every:15:
        - adjust server save
        - announce to_console "<green>Auto-Save für Denizen ausgeführt"
        - announce to_ops "<green>Auto-Save für Denizen ausgeführt"