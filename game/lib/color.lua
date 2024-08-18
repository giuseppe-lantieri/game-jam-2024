function SetColor(r, g, b)
	love.graphics.setColor(love.math.colorFromBytes(r, g, b));
end

function SetColorTable(table)
	love.graphics.setColor(love.math.colorFromBytes(unpack(table)));
end

C_RED = { love.math.colorFromBytes(255, 0, 0) };
C_GREEN = { love.math.colorFromBytes(0, 255, 0) };
C_BLUE = { love.math.colorFromBytes(0, 0, 255) };

function AddColors(a, b)
	local toRet = {};
	for index = 1, #a, 1 do
		toRet[index] = a[index] + b[index];
	end
	return toRet;
end

function SubColors(a, b)
	local toRet = {};
	for index = 1, #a, 1 do
		toRet[index] = a[index] - b[index];
	end
	return toRet;
end

function ColorUi(r, g, b)
	return { normal = { fg = { r, g, b } } }
end
