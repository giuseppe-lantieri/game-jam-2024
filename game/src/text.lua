Text = {}
Text.r = false
Text.ended = false


function Text:update()
	local w, h = love.window.getMode()
	if Text.r then
		suit.Label("Press r to repeat level, return to next", { id = "r", color = ColorUi(255, 255, 255) },
			w / 2 - 50, h / 2 - 15, 100, 30)
	end
	if Text.ended then
		suit.Label("level ended", { id = "r", color = ColorUi(255, 255, 255) },
			w / 2 - 50, h / 2 - 15, 100, 30)
	end
end
