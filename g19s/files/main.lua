-- prevent loading this mod if the game doesn't support weapon mods on this version (we're likely not on the BETA branch which adds weapon mod support)
if not game.modSupport or not game.modSupport.weaponMods then
	return
end

spritesheetParser:parse("textures/bs_glock19s_ui")

register.newSoundData({
	name = "glock19s_fire",
	sound = {"sounds/glock19s_fire.ogg"},
	soundType = "static",
	fadeDistance = 100, -- at what distance does the sound start fading?
	maxDistance = 400, -- at what distance + fadeDistance do we no longer hear the sound?
	looping = false,
	volume = 0.3,
	pitchVariance = sounds.genericPitchVariance,
	volumeType = sound.VOLUME_TYPES.EFFECTS
}, 
6 -- how many instances of this sound can be playing at a time?
)

local g19s = {}
local usp = weapons:getData("usp")

g19s.id = "glock19s"
g19s.name = _T("WEAPON_NAME_GLOCK19S", "Glock-19 S")
g19s.trivia = _T("WEAPON_NAME_GLOCK19S_TRIVIA", "Silenced version of Glock-19")
g19s.NPC = false
g19s.fireSound = "glock19s_fire"
g19s.noiseChange = usp.noiseChange
g19s.noiseRadius = usp.noiseRadius * 1.1
g19s.config = usp.config
g19s.uiIcon = "hud_wep_glock19s_active"
g19s.uiIconInactive = "hud_wep_glock19s_inactive"
g19s.uiIconIdle = "hud_wep_glock19s_idle"
g19s.noiseTravelOverride = usp.noiseTravelOverride
g19s.muzzleFlashShadows = usp.muzzleFlashShadows
g19s.suppressed = true

weapons:register(g19s, "glock19")
game.getCampaignData("intravenous"):addLoadoutWeapon(weapons.TYPES.SECONDARY, "glock19s")
