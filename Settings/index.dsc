index_flags:
    type: data
    # Aufrufen mit: <script[index_flags].parsed_key[(read)/(write).<Name>]>
    read:
        # Profil
        Profil: <player.flag[Profil]>
        # Main Info
        Level: <player.flag[<player.flag[Profil]>.Level]>
        Rucksack: <player.flag[<player.flag[Profil]>.Rucksack]>
        Rasse: <player.flag[<player.flag[Profil]>.Race]>
        Exp: <player.flag[<player.flag[profil]>.EXP.Exp]>
        ExpTarget: <player.flag[<player.flag[Profil]>.Exp.Target]>
        # Geld
        Money: <player.flag[<player.flag[Profil]>.Economy.Money]>
        Bank: <player.flag[<player.flag[Profil]>.Economy.Bank]>
        # Main Stats
        Stats-Leben: <player.flag[<player.flag[Profil]>.Stats.Leben]>
        Stats-Leben-Regen: <player.flag[<player.flag[Profil]>.Stats.Leben_Regen]>
        Stats-Dmg: <player.flag[<player.flag[Profil]>.Stats.Dmg]>
        Stats-Def: <player.flag[<player.flag[Profil]>.Stats.Dmg]>
        Stats-Mana: <player.flag[<player.flag[Profil]>.Stats.Mana]>
        Stats-ManaMax: <player.flag[<player.flag[Profil]>.Stats.ManaMax]>
        Stats-Stamina: <player.flag[<player.flag[Profil]>.Stats.Stamina]>
        Stats-StaminaMax: <player.flag[<player.flag[Profil]>.Stats.StaminaMax]>
        Stats-Speed: <player.flag[<player.flag[Profil]>.Stats.Speed]>
        # Skill Stats
        Skills-Combat-Level: <player.flag[<player.flag[Profil]>.Skills.Combat.Level]>
        Skills-Combat-Exp: <player.flag[<player.flag[Profil]>.Skills.Combat.Exp]>
        Skills-Combat-Target: <player.flag[<player.flag[Profil]>.Skills.Combat.Target]>
        Skills-Combat-MaxDrop: <player.flag[<player.flag[Profil]>.Skills.Combat.MaxDrop]>
        Skills-Mining-Level: <player.flag[<player.flag[Profil]>.Skills.Mining.Level]>
        Skills-Mining-Exp: <player.flag[<player.flag[Profil]>.Skills.Mining.Exp]>
        Skills-Mining-Target: <player.flag[<player.flag[Profil]>.Skills.Mining.Target]>
        Skills-Mining-MaxDrop: <player.flag[<player.flag[Profil]>Skills.Mining.MaxDrop]>
        Skills-Foraging-Level: <player.flag[<player.flag[Profil]>.Skills.Foraging.Level]>
        Skills-Foraging-Exp: <player.flag[<player.flag[Profil]>.Skills.Foraging.Exp]>
        Skills-Foraging-Target: <player.flag[<player.flag[Profil]>.Skills.Foraging.Target]>
        Skills-Foragin-MaxDropchance: <player.flag[<player.flag[Profil]>.Skills.Foraging.MaxDropchance]>
        Skills-Foraging-MaxDrop: <player.flag[<player.flag[Profil]>.Skills.Foraging.MaxDrop]>
        Skills-Farming-Level: <player.flag[<player.flag[Profil]>.Skills.Farming.Level]>
        Skills-Farming-Exp: <player.flag[<player.flag[Profil]>.Skills.Farming.Exp]>
        Skills-Farming-Target: <player.flag[<player.flag[Profil]>.Skills.Farming.Target]>
        Skills-Farming-MaxDrop: <player.flag[<player.flag[Profil]>.Skills.Farming.MaxDrop]>
        Skills-Fishing-Level: <player.flag[<player.flag[Profil]>.Skills.Fishing.Level]>
        Skills-Fishing-Exp: <player.flag[<player.flag[Profil]>.Skills.Fishing.Exp]>
        Skills-Fishing-Target: <player.flag[<player.flag[Profil]>.Skills.Fishing.Target]>
        Skills-Fishing-MaxDrop: <player.flag[<player.flag[Profil]>.Skills.Fishing.MaxDrop]>
        # Profession Stats
        Profession-Blacksmith-Level: <player.flag[<player.flag[Profil]>.Professions.Blacksmith.Level]>
        Profession-Blacksmith-Exp: <player.flag[<player.flag[Profil]>.Professions.Blacksmith.Exp]>
        Profession-Blacksmith-Target: <player.flag[<player.flag[Profil]>.Professions.Blacksmith.Target]>
        Profession-Blacksmith-MaxDrop: <player.flag[<player.flag[Profil]>.Professions.Blacksmith.MaxDrop]>
        Profession-Weaponsmith-Level: <player.flag[<player.flag[Profil]>.Professions.Weaponsmith.Level]>
        Profession-Weaponsmith-Exp: <player.flag[<player.flag[Profil]>.Professions.Weaponsmith.Exp]>
        Profession-Weaponsmith-Target: <player.flag[<player.flag[Profil]>.Professions.Weaponsmith.Target]>
        Profession-Weaponsmith-MaxDrop: <player.flag[<player.flag[Profil]>.Professions.Weaponsmith.MaxDrop]>
        Profession-Armorer-Level: <player.flag[<player.flag[Profil]>.Professions.Armorer.Level]>
        Profession-Armorer-Exp: <player.flag[<player.flag[Profil]>.Professions.Armorer.Exp]>
        Profession-Armorer-Target: <player.flag[<player.flag[Profil]>.Professions.Armorer.Target]>
        Profession-Armorer-MaxDrop: <player.flag[<player.flag[Profil]>.Professions.Armorer.MaxDrop]>
        Profession-Cook-Level: <player.flag[<player.flag[Profil]>.Professions.Cook.Level]>
        Profession-Cook-Exp: <player.flag[<player.flag[Profil]>.Professions.Cook.Exp]>
        Profession-Cook-Target: <player.flag[<player.flag[Profil]>.Professions.Cook.Target]>
        Profession-Cook-MaxDrop: <player.flag[<player.flag[Profil]>.Professions.Cook.MaxDrop]>
    write:
        # Main Info
        Level: <player.flag[Profil]>.Level
        Rasse: <player.flag[Profil]>.Race
        Klasse: <player.flag[Profil]>.Klasse
        Exp: <player.flag[Profil]>.EXP.Exp
        ExpTarget: <player.flag[Profil]>.EXP.Target
        # Geld
        Money: <player.flag[Profil]>.Economy.Money
        Bank: <player.flag[Profil]>.Economy.Bank
        # Main Stats
        Stats-Leben: <player.flag[Profil]>.Stats.Leben
        Stats-Leben-Regen: <player.flag[Profil]>.Stats.Leben_Regen
        Stats-Dmg: <player.flag[Profil]>.Stats.Dmg
        Stats-Def: <player.flag[Profil]>.Stats.Def
        Stats-Mana: <player.flag[Profil]>.Stats.Mana
        Stats-ManaMax: <player.flag[Profil]>.Stats.ManaMax
        Stats-Stamina: <player.flag[Profil]>.Stats.Stamina
        Stats-Stamina: <player.flag[Profil]>.Stats.StaminaMax
        Stats-Speed: <player.flag[Profil]>.Stats.Speed
        # Skill Stats
        Skills-Combat-Level: <player.flag[Profil]>.Skills.Combat.Level
        Skills-Combat-Exp: <player.flag[Profil]>.Skills.Combat.Exp
        Skills-Combat-Target: <player.flag[Profil]>.Skills.Combat.Target
        Skills-Combat-MaxDrop: <player.flag[Profil]>.Skills.Combat.MaxDrop
        Skills-Mining-Level: <player.flag[Profil]>.Skills.Mining.Level
        Skills-Mining-Exp: <player.flag[Profil]>.Skills.Mining.Exp
        Skills-Mining-Target: <player.flag[Profil]>.Skills.Mining.Target
        Skills-Mining-MaxDrop: <player.flag[Profil]>.Skills.Mining.MaxDrop
        Skills-Foraging-Level: <player.flag[Profil]>.Skills.Foraging.Level
        Skills-Foraging-Exp: <player.flag[Profil]>.Skills.Foraging.Exp
        Skills-Foraging-Target: <player.flag[Profil]>.Skills.Foraging.Target
        Skills-Foraging-MaxDrop: <player.flag[Profil]>.Skills.Foraging.MaxDrop
        Skills-Farming-Level: <player.flag[Profil]>.Skills.Farming.Level
        Skills-Farming-Exp: <player.flag[Profil]>.Skills.Farming.Exp
        Skills-Farming-Target: <player.flag[Profil]>.Skills.Farming.Target
        Skills-Farming-MaxDrop: <player.flag[Profil]>.Skills.Farming.MaxDrop
        Skills-Fishing-Level: <player.flag[Profil]>.Skills.Fishing.Level
        Skills-Fishing-Exp: <player.flag[Profil]>.Skills.Fishing.Exp
        Skills-Fishing-Target: <player.flag[Profil]>.Skills.Fishing.Target
        Skills-Fishing-MaxDrop: <player.flag[Profil]>.Skills.Fishing.MaxDrop
        # Profession Stats
        Profession-Blacksmith-Level: <player.flag[Profil]>.Professions.Blacksmith.Level
        Profession-Blacksmith-Exp: <player.flag[Profil]>.Professions.Blacksmith.Exp
        Profession-Blacksmith-Target: <player.flag[Profil]>.Professions.Blacksmith.Target
        Profession-Blacksmith-MaxDrop: <player.flag[Profil]>.Professions.Blacksmith.MaxDrop
        Profession-Weaponsmith-Level: <player.flag[Profil]>.Professions.Weaponsmith.Level
        Profession-Weaponsmith-Exp: <player.flag[Profil]>.Professions.Weaponsmith.Exp
        Profession-Weaponsmith-Target: <player.flag[Profil]>.Professions.Weaponsmith.Target
        Profession-Weaponsmith-MaxDrop: <player.flag[Profil]>.Professions.Weaponsmith.MaxDrop
        Profession-Armorer-Level: <player.flag[Profil]>.Professions.Armorer.Level
        Profession-Armorer-Exp: <player.flag[Profil]>.Professions.Armorer.Exp
        Profession-Armorer-Target: <player.flag[Profil]>.Professions.Armorer.Target
        Profession-Armorer-MaxDrop: <player.flag[Profil]>.Professions.Armorer.MaxDrop
        Profession-Cook-Level: <player.flag[Profil]>.Professions.Cook.Level
        Profession-Cook-Exp: <player.flag[Profil]>.Professions.Cook.Exp
        Profession-Cook-Target: <player.flag[Profil]>.Professions.Cook.Target
        Profession-Cook-MaxDrop: <player.flag[Profil]>.Professions.Cook.MaxDrop