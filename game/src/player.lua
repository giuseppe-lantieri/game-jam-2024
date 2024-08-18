Player = {}
Player.exP = {}

function Player:create_piece(type)
	table.insert(Player.exP, Player.piece);

	if type == "box" then
		Player.piece = world:newRectangleCollider(Player.x, Player.y, Player.width, Player.height)
	end
	if type == "t_l" then
		Player.piece = world:newPolygonCollider({ Player.x, Player.y, Player.x + Player.width, Player.y, Player.x, Player
		.y - Player.height })
	end
	if type == "t_r" then
		Player.piece = world:newPolygonCollider({ Player.x, Player.y, Player.x + Player.width, Player.y - Player.height,
			Player.x + Player.width, Player.y })
	end


	if Player.piece ~= nil then
		Player.piece:setRestitution(0)
		Player.piece:applyAngularImpulse(0)
		Player.piece:setCollisionClass("Player")

		Player.piece:setPostSolve(function(collider_1, collider_2)
			if collider_1.collision_class == 'Player' and collider_2.collision_class == 'Key' then
				-- print("new level unlocked, ", index_level)
				destroy_level();
				Text.r = true;
				game_state = 3;
			end
		end)
	end
end

function Player:move(dt)
	if Player.piece ~= nil and not Modal.show_modal then
		dx, dy = Player.piece:getLinearVelocity()

		if love.keyboard.isDown('d') then
			Player.piece:setLinearVelocity(Player.width * 10, dy)
		end
		if love.keyboard.isDown('a') then
			Player.piece:setLinearVelocity(-Player.width * 10, dy)
		end
	end
end

function Player:destroy()
	if Player.piece ~= nil then
		Player.piece:destroy();
		Player.piece = nil;
	end
	for index, value in ipairs(Player.exP) do
		print(index, value)
		if value ~= nil then
			value:destroy();
			Player.exP[index] = nil;
		end
	end
end

function Player:resize(w, h)
	Player:destroy()
	Player.width = h / 20;
	Player.height = Player.width;

	Player.x = Player.width;
	Player.y = 0;
end

function Player:scale(d, f)
	if (d == "height") then
		if Player.height + f > 0 then
			Player.height = Player.height + f;
		end
	end
	if (d == "width") then
		if Player.width + f > 0 then
			Player.width = Player.width + f;
		end
	end
end
