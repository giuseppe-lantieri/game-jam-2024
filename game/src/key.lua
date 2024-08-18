Key       = {}

Key.x     = 100
Key.y     = 100
Key.w     = 10
Key.h     = 10
Key.exist = true

function Key:draw()
	if Key.exist then
		local vertices  = {
			Key.x, Key.y,
			Key.x + Key.w, Key.y,
			Key.x + Key.w * 2, Key.y,
			Key.x + Key.w * 2, Key.y + Key.h,
			Key.x + Key.w, Key.y + Key.w,
			Key.x + Key.w, Key.y + Key.h * 2,
			Key.x + Key.w * 2, Key.y + Key.h * 2,
			Key.x + Key.w * 2, Key.y + Key.h * 3,
			Key.x + Key.w, Key.y + Key.h * 3,
			Key.x + Key.w, Key.y + Key.h * 4,
			Key.x + Key.w * 2, Key.y + Key.h * 4,
			Key.x + Key.w * 2, Key.y + Key.h * 6,
			Key.x - Key.w, Key.y + Key.h * 6,
			Key.x - Key.w, Key.y + Key.h * 4,
			Key.x, Key.y + Key.h * 4,
			Key.x, Key.y
		}
		local triangles = love.math.triangulate(vertices)

		-- SetColor(0, 0, 0);
		-- love.graphics.rectangle("fill", Key.x - Key.w * 4, Key.y - Key.h, Key.w * 8, Key.h * 10);
		SetColor(255, 255, 255);
		for i, triangle in ipairs(triangles) do
			love.graphics.polygon("fill", triangle)
		end
	end
end

function Key:setPosition(nx, ny, nq)
	Key.x = nx + (nx * 0.015)
	Key.y = ny;
	Key.w = nq;
	Key.h = nq;
	Key.exist = true
end
