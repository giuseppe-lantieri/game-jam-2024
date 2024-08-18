Box = {}
Box.hg = 50;
Box.ww = 50;

function Box:resize(w, h)
	Box:destroy();
	Box.g = world:newRectangleCollider(0, h, w, Box.hg)
	Box.wl = world:newRectangleCollider(0 - Box.ww, 0, Box.ww, h)
	Box.wr = world:newRectangleCollider(w, 0, Box.ww, h)
	Box.g:setType('static')
	Box.wl:setType('static')
	Box.wr:setType('static')
end

function Box:destroy()
	if Box.g ~= nil and Box.wr ~= nil and Box.wl ~= nil then
		Box.g:destroy();
		Box.g = nil
		Box.wr:destroy();
		Box.wr = nil
		Box.wl:destroy();
		Box.wl = nil
	end
end
