set_level:
    type: command
    name: Set-level
    description: Does something
    usage: /set-level <&lt>arg<&gt>
    permission: dscript.mycmd
    script:
    - define level <context.args.get[1]>
    #- repeat <[level]>:


set_xp:
    type: command
    name: Set-xp
    description: Does something
    usage: /Set-xp <&lt>arg<&gt>
    permission: dscript.mycmd
    script:
    - define xp <context.args.get[1]>
    - flag <player> <player.flag[Profil]>.EXP.Exp:<[xp]>