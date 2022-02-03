-- prevent loading this mod if the game doesn't support weapon mods on this version (we're likely not on the BETA branch which adds weapon mod support)
if not game.modSupport or not game.modSupport.weaponMods then
	return
end

function deepCopy(o)
	if type(o) ~= "table" then
		return o
	end
	
	local n = {}
	for k, v in pairs(o) do
		if type(v) == "table" then
			n[k] = deepCopy(v)
		else
			n[k] = v
		end
	end
	return n
end

spritesheetParser:parse("textures/bs_mp5sd_ui")
spritesheetParser:parse("textures/bs_mp5sd_world")

register.newSoundData({
	name = "mp5sd_fire",
	sound = {"sounds/mp5sd_fire.ogg"},
	soundType = "static",
	fadeDistance = 200, -- at what distance does the sound start fading?
	maxDistance = 500, -- at what distance + fadeDistance do we no longer hear the sound?
	looping = false,
	volume = 0.2,
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
weapon.price = 2000
weapon.NPC = false
weapon.noiseRadius = p320.noiseRadius * 1.1
weapon.noiseTravelOverride = p320.noiseTravelOverride
weapon.uiIcon = "hud_wep_mp5sd_active"
weapon.uiIconInactive = "hud_wep_mp5sd_inactive"
weapon.uiIconIdle = "hud_wep_mp5sd_idle"
weapon.fireSound = "mp5sd_fire"
weapon.suppressed = true
weapon.worldSprite = "world_mp5sd"

local bulletFactor = 0.8

weapon.bulletSpeed = mp5.bulletSpeed * bulletFactor
weapon.damage = mp5.damage * bulletFactor
weapon.damageMin = mp5.damageMin * bulletFactor
weapon.rangeMin = mp5.rangeMin * bulletFactor -- start losing damage past this range
weapon.rangeMax = mp5.rangeMax * bulletFactor -- reach damageMin at this range

weapon.muzzleFlashShadows = p320.muzzleFlashShadows
weapon.muzzleflashConfigs = p320.muzzleflashConfigs
weapon.config = deepCopy(mp5.config)  -- don't modify existing configuration, it would mess up the original mp5
weapon.config.player.muzzleOffset.side = 4


weapons:register(weapon, "mp5")
game.getCampaignData("intravenous"):addLoadoutWeapon(weapons.TYPES.PRIMARY, "mp5sd")
