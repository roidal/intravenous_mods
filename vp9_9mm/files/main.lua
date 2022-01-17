-- prevent loading this mod if the game doesn't support weapon mods on this version (we're likely not on the BETA branch which adds weapon mod support)
if not game.modSupport or not game.modSupport.weaponMods then
	return
end

local weapon = {}
vp9 = weapons:getData("vp9")

weapon.id = "vp9_9"
weapon.name = _T("WEAPON_NAME_VP9_9", "B&T VP9 9x19mm")
weapon.trivia = _T("WEAPON_NAME_VP9_9_TRIVIA", "The 9x19mm Version of the VP9. Using more common ammunition but being 20% louder.")
weapon.ammoType = "9x19MM"
weapon.noiseRadius = vp9.noiseRadius * 1.2
weapon.maxAmmo = vp9.magSize * 3
weapon.ammoOnGive = vp9.magSize * 2

weapons:register(weapon, "vp9")
game.getCampaignData("intravenous"):addLoadoutWeapon(weapons.TYPES.SECONDARY, "vp9_9")
