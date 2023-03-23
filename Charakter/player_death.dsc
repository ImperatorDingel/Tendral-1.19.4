Player_death:
    type: world
    events:
        on player dies:
        - determine passively cancelled
        - teleport <player> graveyard
        - narrate "Spieler hat versucht gegen <context.damager.name> <context.damager.entity_type> zu kämpfen und verloren"
