Points = {}
Points.points = 0;
Points.recover_points = 0;

function Points.insert()
	local area = 0;
	if type_piece == "box" then
		area = Player.width * Player.height;
	end
	if type_piece == "t_l" or type_piece == "t_r" then
		area = (Player.width * Player.height) / 2;
	end
	Points.points = Points.points + area;
end

function Points:finish()
	Points.insert();
	Points.recover_points = Points.points;
end

function Points:recover()
	Points.points = Points.recover_points;
end

function Points.update(dt)
	suit.Label("Points:" .. Points.points, { id = "points", color = ColorUi(255, 255, 255) }, Modal.w / 30, Modal.h / 30)
	suit.Label("Last Points:" .. Points.recover_points, { id = "points", color = ColorUi(255, 255, 255) },
		Modal.w / 30 * 6,
		Modal.h / 30)
end
