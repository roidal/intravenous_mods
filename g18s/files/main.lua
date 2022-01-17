-- prevent loading this mod if the game doesn't support weapon mods on this version (we're likely not on the BETA branch which adds weapon mod support)
if not game.modSupport or not game.modSupport.weaponMods then
	return
end

spritesheetParser:parse("textures/bs_glock18s_ui")

local g18s = {}
local usp = weapons:getData("usp")

g18s.id = "glock18s"
g18s.name = _T("WEAPON_NAME_GLOCK18S", "Glock-18 S")
g18s.trivia = _T("WEAPON_NAME_GLOCK18S_TRIVIA", "Silenced version of Glock-18")
g18s.NPC = false
g18s.fireSound = usp.fireSound
g18s.noiseChange = usp.noiseChange
g18s.noiseRadius = usp.noiseRadius * 1.2
g18s.config = usp.config
g18s.uiIcon = "hud_wep_glock18s_active"
g18s.uiIconInactive = "hud_wep_glock18s_inactive"
g18s.uiIconIdle = "hud_wep_glock18s_idle"
g18s.noiseTravelOverride = usp.noiseTravelOverride
g18s.muzzleFlashShadows = usp.muzzleFlashShadows
g18s.unique = false

weapons:register(g18s, "glock18")
game.getCampaignData("intravenous"):addLoadoutWeapon(weapons.TYPES.SECONDARY, "glock18s")
