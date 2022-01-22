-- encapsulate our functionality in an event handler
local script = {}

-- we want to perform this action once a specific event has occured
-- this way we can apply the action on ALL weapons, regardless of their load order
-- for example this mod may be loaded before a weapon mod

function script:handleEvent(event)
	local weps = weapons.registeredNonBases -- list of all weapons that aren't weapon bases

	for i = 1, #weps do -- iterate over the list
		local this = weps[i]
		
		if this.unique then
			this.unique = false
		end
	end
end

-- add the event handler
local catchableEvents = {game.EVENTS.ON_START_FINISH} -- the event we want to run the script after
events:addDirectReceiver(script, catchableEvents)
