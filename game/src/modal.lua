Modal = {};
Modal.show_modal = false
Modal.unit_sistem = {
	{ unit = "pizza",  valueW = 5,   valueH = 5 },
	{ unit = "tower",  valueW = 1,   valueH = 100 },
	{ unit = "guitar", valueW = 1.3, valueH = 2.5 },
	{ unit = "hands",  valueW = 5,   valueH = 12 },
	{ unit = "finger", valueW = 1,   valueH = 3 },
}
Modal.current_index = 1;

function Modal:setModal()
	Modal.w, Modal.h = love.window.getMode()
	Modal.show_modal = not Modal.show_modal;
end

function Modal:update(dt)
	if Modal.show_modal then
		suit.Label("Width:", { id = "width", color = ColorUi(255, 255, 255) }, Modal.w / 2 - 200, Modal.h / 2 - 100, 50,
			50)
		suit.Label(math.ceil(Player.width / Modal.unit_sistem[Modal.current_index].valueW),
			{ id = "witdth_number", color = ColorUi(255, 255, 255) }, Modal.w / 2 - 25, Modal.h / 2 - 100, 50,
			50)
		if suit.Button("<", { id = "widht_left" }, Modal.w / 2 - 100, Modal.h / 2 - 100, 50, 50).hit then
			Player:scale("width", -Modal.unit_sistem[Modal.current_index].valueW);
		end

		if suit.Button(">", { id = "widht_right" }, Modal.w / 2 + 50, Modal.h / 2 - 100, 50, 50).hit then
			Player:scale("width", Modal.unit_sistem[Modal.current_index].valueW);
		end

		suit.Label("Height:", { id = "height", color = ColorUi(255, 255, 255) }, Modal.w / 2 - 200, Modal.h / 2, 50, 50)
		suit.Label(math.ceil(Player.height / Modal.unit_sistem[Modal.current_index].valueH),
			{ id = "height_number", color = ColorUi(255, 255, 255) }, Modal.w / 2 - 25, Modal.h / 2, 50, 50)
		if suit.Button("<", { id = "height_left" }, Modal.w / 2 - 100, Modal.h / 2, 50, 50).hit then
			Player:scale("height", -Modal.unit_sistem[Modal.current_index].valueH);
		end

		if suit.Button(">", { id = "height_right" }, Modal.w / 2 + 50, Modal.h / 2, 50, 50).hit then
			Player:scale("height", Modal.unit_sistem[Modal.current_index].valueH);
		end

		suit.Label("Measure:", { id = "measure", color = ColorUi(255, 255, 255) }, Modal.w / 2 - 200, Modal.h / 2 + 100,
			60, 50)
		suit.Label(Modal.unit_sistem[Modal.current_index].unit, { id = "measure_number", color = ColorUi(255, 255, 255) },
			Modal.w / 2 - 25, Modal.h / 2 + 100, 50, 50)
		if suit.Button("<", { id = "measure_left" }, Modal.w / 2 - 100, Modal.h / 2 + 100, 50, 50).hit then
			if Modal.current_index > 1 then
				Modal.current_index = Modal.current_index - 1
			end
		end

		if suit.Button(">", { id = "measure_right" }, Modal.w / 2 + 50, Modal.h / 2 + 100, 50, 50).hit then
			if Modal.current_index < #Modal.unit_sistem then
				Modal.current_index = Modal.current_index + 1
			end
		end
	end
end

function Modal:draw()
	if Modal.show_modal then
		SetColor(0, 0, 0)
		love.graphics.rectangle("fill", Modal.w / 2 - 250, Modal.h / 2 - 200, 500, 400)
		SetColor(255, 255, 255)
		love.graphics.rectangle("line", Modal.w / 2 - 250, Modal.h / 2 - 200, 500, 400)
	end
end
