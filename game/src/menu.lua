Menu = {}
function Menu:update(dt)
	if game_state == -1 then
		suit.Label("Nome Gioco:", { id = "title", color = ColorUi(255, 255, 255) }, Modal.w / 2 - 200, Modal.h / 8,
			400, 50)
		suit.Label(
			"Tutorial:\n-a-d:\t\t\t\tto move\n-space:\t\t\tto scale\n-r:\t\t\t\t\tto replay\n\n\nGoal:\nPass All the Levels with the lowest point possible\n\nGame by GanzioBello\nMusic by Refuse",
			{ id = "tutorial", color = ColorUi(255, 255, 255), align = "left" }, Modal.w / 2 - 200, Modal.h / 1.5,
			400, 50);
		if suit.Button("Play!", { id = "play" }, Modal.w / 2 - 200, Modal.h / 2, 400, 50).hit then
			game_state = 1;
		end
	end
end

function Menu:draw()
	if game_state == -1 then
		SetColor(0, 0, 0)
		love.graphics.rectangle("fill", Modal.w / 2 - 250, Modal.h / 8, 500, Modal.h / 1.2)
		SetColor(255, 255, 255)
		love.graphics.rectangle("line", Modal.w / 2 - 250, Modal.h / 8, 500, Modal.h / 1.2)
	end
end
