Debugger:
    type: command
    name: debugger
    description: Does something
    usage: /debugger <&lt>arg<&gt>
    permission: dscript.debugger
    tab completions:
        1: read|write
        2: <script[index_flags].list_keys[read]>
    script:
    - define arg1 <context.args.get[1]>
    - define arg2 <context.args.get[2]>
    - define arg3 <context.args.get[3]>
    - if <context.args.get[1]> == read:
        - narrate <script[index_flags].parsed_key[<[arg1]>.<[arg2]>]>
    - if <context.args.get[1]> == write:
        - flag <player> <script[index_flags].parsed_key[<[arg1]>.<[arg2]>]>:<[arg3]>
        - narrate <script[index_flags].parsed_key[<[arg1]>.<[arg2]>]>:<[arg3]>
    - narrate debugger!