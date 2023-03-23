Baumodus:
  type: command
  name: Baumodus
  description: Does something
  usage: /Baumodus <&lt>Does something<&gt>
  script:
  - if <server.has_whitelist>:
    - adjust server has_whitelist:false
    - narrate "Baumodus ausgeschaltet"
  - else:
    - adjust server has_whitelist:true
    - narrate "Baumodus eingeschaltet"

Baumodus_World:
    type: world
    events:
        on player join:
        - if <server.has_whitelist>:
            - if <player.is_whitelisted>:
                - stop
            - else:
                - kick <player> reason:Baumodus<&sp>ist<&sp>aktiviert.
                - determine cancelled