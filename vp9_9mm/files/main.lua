-- prevent loading this mod if the game doesn't support weapon mods on this version (we're likely not on the BETA branch which adds weapon mod support)
if not game.modSupport or not game.modSupport.weaponMods then
	return
end

function copy(o)
	local n = {}
	for k, v in pairs(o) do	
		n[k] = v
	end
	return n
end

local weapon = copy(weapons:getData("vp9"))

weapon.id = "vp9_9"
weapon.name = _T("WEAPON_NAME_VP9_9", "B&T VP9 9x19mm")
weapon.trivia = _T("WEAPON_NAME_VP9_9_TRIVIA", "The 9x19mm Version of the VP9. Using more common ammunition but being 20% louder.")
weapon.ammoType = "9x19MM"
weapon.noiseRadius = weapon.noiseRadius * 1.2

weapons:register(weapon)
local campaignData = game.getCampaignData("intravenous"):addLoadoutWeapon(weapons.TYPES.SECONDARY, "vp9_9")
