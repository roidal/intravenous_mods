-- prevent loading this mod if the game doesn't support weapon mods on this version (we're likely not on the BETA branch which adds weapon mod support)
if not game.modSupport or not game.modSupport.weaponMods then
	return
end

spritesheetParser:parse("textures/bs_glock19s_ui")

local g19s = {}
local usp = weapons:getData("usp")

g19s.id = "glock19s"
g19s.name = _T("WEAPON_NAME_GLOCK19S", "Glock-19 S")
g19s.trivia = _T("WEAPON_NAME_GLOCK19S_TRIVIA", "Silenced version of Glock-19")
g19s.NPC = false
g19s.fireSound = usp.fireSound
g19s.noiseChange = usp.noiseChange
g19s.noiseRadius = usp.noiseRadius * 1.1
g19s.config = usp.config
g19s.uiIcon = "hud_wep_glock19s_active"
g19s.uiIconInactive = "hud_wep_glock19s_inactive"
g19s.uiIconIdle = "hud_wep_glock19s_idle"
g19s.noiseTravelOverride = usp.noiseTravelOverride
g19s.muzzleFlashShadows = usp.muzzleFlashShadows

weapons:register(g19s, "glock19")
game.getCampaignData("intravenous"):addLoadoutWeapon(weapons.TYPES.SECONDARY, "glock19s")
