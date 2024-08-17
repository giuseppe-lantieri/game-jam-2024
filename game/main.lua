wf = require 'lib/windfield'

function love.load()
	world = wf.newWorld(0, 0, true)
	world:setGravity(0, 512)

	box = world:newRectangleCollider(400 - 50 / 2, 0, 50, 50)
	box:setRestitution(0.8)
	box:applyAngularImpulse(5000)

	ground = world:newRectangleCollider(0, 550, 800, 50)
	wall_left = world:newRectangleCollider(0, 0, 50, 600)
	wall_right = world:newRectangleCollider(750, 0, 50, 600)
	ground:setType('static') -- Types can be 'static', 'dynamic' or 'kinematic'. Defaults to 'dynamic'
	wall_left:setType('static')
	wall_right:setType('static')
end

function love.update(dt)
	world:update(dt)
end

function love.draw()
	world:draw()
end
