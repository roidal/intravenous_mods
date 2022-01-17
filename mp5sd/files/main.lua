-- prevent loading this mod if the game doesn't support weapon mods on this version (we're likely not on the BETA branch which adds weapon mod support)
if not game.modSupport or not game.modSupport.weaponMods then
	return
end

spritesheetParser:parse("textures/bs_mp5sd_ui")

local weapon = {}
mp5 = weapons:getData("mp5")
p320 = weapons:getData("p320")

weapon.id = "mp5sd"
weapon.name = _T("WEAPON_NAME_MP5SD", "MP5SD")
weapon.trivia = _T("WEAPON_NAME_MP5SD_TRIVIA", "Silenced version of the MP5")
weapon.NPC = false
weapon.noiseRadius = p320.noiseRadius * 1.1
weapon.noiseTravelOverride = p320.noiseTravelOverride
weapon.uiIcon = "hud_wep_mp5sd_active"
weapon.uiIconInactive = "hud_wep_mp5sd_inactive"
weapon.uiIconIdle = "hud_wep_mp5sd_idle"
weapon.fireSound = p320.fireSound

weapons:register(weapon, "mp5")
game.getCampaignData("intravenous"):addLoadoutWeapon(weapons.TYPES.PRIMARY, "mp5sd")
