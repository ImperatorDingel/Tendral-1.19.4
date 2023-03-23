AnnounceFormat:
  type: format
  debug: false
  format: <bold>[<red><bold><&sp>!<&sp><white><bold>] <red><bold>[Tendral] <white><bold><[text]>


announce_Server:
    type: command
    name: announce
    description: Does something
    usage: /announce <&lt>arg<&gt>
    permission: Tendral.announce
    script:
    - define text <context.args.get[1].to[last]>
    - announce <[text].separated_by[<&sp>]> format:AnnounceFormat