-- prevent loading this mod if the game doesn't support weapon mods on this version (we're likely not on the BETA branch which adds weapon mod support)
if not game.modSupport or not game.modSupport.weaponMods then
	return
end

local g18p = {}
local g18 = weapons:getData("glock18")

g18p.id = "glock18p"
g18p.trivia = _T("WEAPON_NAME_GLOCK18P_TRIVIA", "Glock-18C for the Primary Slot")
g18p.NPC = false
g18p.unique = false
g18p.type = weapons.TYPES.PRIMARY
g18p.maxAmmo = g18.magSize * 4
g18p.ammoOnGive = g18p.maxAmmo
g18p.price = 1500

weapons:register(g18p, "glock18")
game.getCampaignData("intravenous"):addLoadoutWeapon(weapons.TYPES.PRIMARY, "glock18p")
