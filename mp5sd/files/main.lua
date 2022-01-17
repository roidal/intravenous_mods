-- prevent loading this mod if the game doesn't support weapon mods on this version (we're likely not on the BETA branch which adds weapon mod support)
if not game.modSupport or not game.modSupport.weaponMods then
	return
end

spritesheetParser:parse("textures/bs_mp5sd_ui")

register.newSoundData({
	name = "mp5sd_fire",
	sound = {"sounds/mp5sd_fire.ogg"},
	soundType = "static",
	fadeDistance = 200, -- at what distance does the sound start fading?
	maxDistance = 500, -- at what distance + fadeDistance do we no longer hear the sound?
	looping = false,
	volume = 0.5,
	pitchVariance = sounds.genericPitchVariance,
	volumeType = sound.VOLUME_TYPES.EFFECTS
}, 
6 -- how many instances of this sound can be playing at a time?
)

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
weapon.fireSound = "mp5sd_fire"
weapon.bulletSpeed = 1000


weapons:register(weapon, "mp5")
game.getCampaignData("intravenous"):addLoadoutWeapon(weapons.TYPES.PRIMARY, "mp5sd")
