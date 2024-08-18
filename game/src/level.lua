Level = {}
Level.elements = {}

function Level:load()
	Level.levels = {
		-- level1,
		-- level2,
		level3,
		-- level4,
	}
end

function Level:create(coordinates)
	for index, value in ipairs(coordinates) do
		t = world:newRectangleCollider(value.x, value.y, value.w, value.h)
		t:setType('static')

		if value.key then
			t:setCollisionClass("Key")
			Key:setPosition(value.x * (1 + 0.005), value.y * (1 + 0.005), value.q)
		end

		table.insert(Level.elements, index, t);
	end
end

function Level.getLevel(i, w, h)
	return Level.levels[i](w, h);
end

function Level:clear()
	for k, _ in pairs(Level.elements) do Level.elements[k] = nil end
end

function Level:resize(i, w, h)
	Level:destroy();
	Level:create(Level.getLevel(i, w, h));
end

function Level:destroy()
	for k, value in ipairs(Level.elements) do
		if value ~= nil then
			value:destroy();
			Level.elements[k] = nil
			Key.exist = false;
		end
	end
end

function level1(w, h)
	return {
		{
			x = 0,
			y = h - (h / 20),
			w = (w * 0.375),
			h = h / 20
		},
		{
			x = w - (w * 0.375),
			y = h - (h / 20),
			w = (w * 0.375),
			h = h / 20
		},
		{
			x = w - ((h / 20) * 3),
			y = h - ((h / 20) * 3),
			w = (h / 20),
			h = (h / 10),
			q = h / 200,
			key = true
		}
	}
end

function level2(w, h)
	return {
		{
			x = 0,
			y = h - (h * (3 / 12)),
			w = (w * 3 / 12),
			h = h * 3 / 12
		},
		{
			x = w - (w * 8 / 12),
			y = h - (h * 2 / 12),
			w = (w * 3 / 12),
			h = h * 2 / 12
		},
		{
			x = w - (w * 4 / 12),
			y = h - (h * 8 / 12),
			w = (w * 4 / 12),
			h = h * 8 / 12
		},
		{
			x = w - (w * 2 / 12),
			y = h - (h * 9.5 / 12),
			w = (h / 20),
			h = (h / 10),
			q = h / 200,
			key = true
		}
	}
end

function level3(w, h)
	return {
		{
			x = w * 3 / 16,
			y = (h * (3 / 16)),
			w = w * 2 / 16,
			h = h * 1 / 16
		},
		{
			x = w * 6 / 16,
			y = h * 8 / 16,
			w = w * 2 / 16,
			h = h * 1 / 16
		},
		{
			x = w * 10 / 16,
			y = h * 12 / 16,
			w = w * 2 / 16,
			h = h * 1 / 16
		},
		{
			x = w * 5 / 20,
			y = (h * (1.5 / 20)),
			w = (h / 20),
			h = (h / 10),
			q = h / 200,
			key = true
		}
	}
end

function level4(w, h)
	return {
		{
			x = w * 0 / 18,
			y = h * 10 / 20,
			w = w * 1 / 16,
			h = h * 10 / 20
		},
		{
			x = w * 2 / 18,
			h = h * 9 / 20,
			w = w * 1 / 16,
			y = h * 11 / 20
		},
		{
			x = w * 4 / 18,
			h = h * 7 / 20,
			w = w * 1 / 16,
			y = h * 13 / 20
		},
		{
			x = w * 6 / 18,
			h = h * 4 / 20,
			w = w * 1 / 16,
			y = h * 16 / 20
		},
		{
			x = w * 9 / 18,
			h = h * 6 / 20,
			w = w * 1 / 16,
			y = h * 14 / 20
		},
		{
			x = w * 16 / 18,
			h = h * 9 / 20,
			w = w * 1 / 16,
			y = h * 11 / 20
		},
		{
			x = w * 14 / 18,
			h = h * 7 / 20,
			w = w * 1 / 16,
			y = h * 13 / 20
		},
		{
			x = w * 12 / 18,
			h = h * 4 / 20,
			w = w * 1 / 16,
			y = h * 16 / 20
		},
		{
			x = w * 16 / 18,
			y = (h * (9 / 20)),
			w = (h / 20),
			h = (h / 10),
			q = h / 200,
			key = true
		}
	}
end
