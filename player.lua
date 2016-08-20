player = {
  pos = {0,0}, -- position x et y du joueur, ordre {x,y}
  dim = {32,32}, -- dimensions du joueur, ordre {w,h}
  r = 0, -- rotation du joueur
  v = {0,0}, -- vélocité x et y du joueur, ordre {x,y}
  s = 2, -- vitesse du joueur
}
player.canvas = love.graphics.newCanvas(player.dim[1], player.dim[2])
function player:update(dt)
  player:move(dt)
end
function player:draw()
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear()
  love.graphics.rectangle("line", 0, 0, self.dim[1], self.dim[2])
  love.graphics.setCanvas()
  love.graphics.draw(self.canvas, math.floor(self.pos[1]-self.dim[1]/2), math.floor(self.pos[2]-self.dim[2]/2), self.r, 1, 1, self.dim[1]/2, self.dim[2]/2)
end
function player:move(dt)
  local key = love.keyboard.isDown
  local mouse = {love.mouse.getPosition()}
  local pos = {0,0}
  for i = 1, 2 do
    self.pos[i] = self.pos[i] + (mouse[i]-(self.pos[i])) * self.s * dt -- modifier la position du joueur
    pos[i] = (self.pos[i]) - mouse[i] -- définir les variables pour la rotation
  end
  self.r = math.atan2(pos[2],pos[1]) -- modifier la rotation du joueur
end
function clamp(x, min, max)
  return x < min and min or (x > max and max or x)
end