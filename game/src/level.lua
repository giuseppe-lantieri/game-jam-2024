Level = {}
Level.elements = {}


function Level:create(coordinates)
	for index, value in ipairs(coordinates) do
		t = world:newRectangleCollider(value.x, value.y, value.w, value.h)
		t:setType('static')

		if value.key then
			t:setCollisionClass("Key")
			Key:setPosition(value.x, value.y)
		end

		table.insert(Level.elements, index, t);
	end
end

function levelOne(w, h)
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
			key = true
		}
	}
end

Level.levels = {
	levelOne,
	levelOne
}

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
