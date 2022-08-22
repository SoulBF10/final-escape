local function lerp(start, goal, alpha)
	return (start + ((goal - start) * alpha))
end

-- game crashes when i condense these into a table so theyre all variables now
local window_default_x
local window_default_y
local window_shake_x = 0
local window_shake_y = 0
local window_shake_lerp = 0.05

function onCreate()
	window_default_x = getPropertyFromClass("openfl.Lib", "application.window.x")
	window_default_y = getPropertyFromClass("openfl.Lib", "application.window.y")
end

function onEvent(name, value_1, value_2)
	local events = {
		["window_shake"] = function()
			window_shake_x = window_shake_x + value_1
			window_shake_y = window_shake_y + value_2
		end
	}
	
	if events[name] then
		events[name]()
	end
end

function onUpdate()
	local window_shake_temp_x = math.random(-window_shake_x, window_shake_x)
	local window_shake_temp_y = math.random(-window_shake_y, window_shake_y)
	window_shake_x = lerp(window_shake_x , 0, window_shake_lerp)
	window_shake_y = lerp(window_shake_y , 0, window_shake_lerp)
	setPropertyFromClass("openfl.Lib", "application.window.x", window_default_x + window_shake_temp_x)
	setPropertyFromClass("openfl.Lib", "application.window.y", window_default_y + window_shake_temp_y)
end
