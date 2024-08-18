wf = require 'lib.windfield'
suit = require "lib.suit"
require "lib.color"

require "src.player";
require "src.box";
require "src.level"
require "src.key"
require "src.modal"
require "src.points";
require "src.text"
require "src.menu"

types = { "box", "t_l", "t_r" };
index_type = 1;
type_piece = types[index_type];

index_level = 1;



function love.load()
	world = wf.newWorld(0, 0, true)
	world:addCollisionClass("Player");
	world:addCollisionClass("Key");
	Level:load();

	create_level()
	game_state = -1;
end

function love.update(dt)
	if game_state ~= 2 then
		world:update(dt)
		Points.update(dt)
		Modal:update(dt)
		Player:move(dt)
	end
	Menu:update();
	Text:update()
end

function love.draw()
	SetColor(225, 225, 225)
	if game_state ~= -1 and game_state ~= 2 and game_state ~= 3 then
		world:draw()
		Key:draw()
		Modal:draw()
	end
	Menu:draw()
	suit.draw()
end

function love.keypressed(key)
	if game_state == 1 then
		if key == "space" then
			Modal:setModal()
			if Modal.show_modal then
				Points.insert()
			else
				Player:create_piece(type_piece)
			end
		end
	end
	if key == "r" then
		Text.r = false;
		Text.ended = false;
		Points:recover();
		create_level();
		game_state = 1;
	end
	if key == "return" and game_state == 3 then
		Text.r = false;
		Text.ended = false;
		Points:finish()
		nextlevel();
	end
end

function love.resize()
	create_level()
end

function destroy_level()
	Player:destroy();
	Box:destroy();
	Level:destroy();
end

function create_level()
	destroy_level();

	Modal.w, Modal.h = love.window.getMode()
	world:setGravity(0, Modal.h * 0.85)
	Player:resize(Modal.w, Modal.h)
	Box:resize(Modal.w, Modal.h)
	Level:resize(index_level, Modal.w, Modal.h)
	Player:create_piece(type_piece)
end

function nextlevel()
	if index_level + 1 <= #Level.levels then
		index_level = index_level + 1;
		Text.r = false;
		create_level();
		game_state = 1;
	else
		Text.ended = true
		game_state = 2;
	end
end
