require "player"
require "map"

function love.load()
	
end
function love.update(dt)
	player:update(dt)
end
function love.draw()
  player:draw()
end