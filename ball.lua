local Ball = {}

local maxBallSpeed = 20
local maxStartSpeed = 5

function Ball:init()
    Ball.x = love.graphics.getWidth() / 2
    Ball.y = love.graphics.getHeight() / 2
    Ball.xSpeed = love.math.random(-maxStartSpeed, maxStartSpeed)
    Ball.ySpeed = love.math.random(-maxStartSpeed, maxStartSpeed)
    Ball.radius = 6
end

function Ball:move()
    -- Move ball
    self.x = self.x + self.xSpeed
    self.y = self.y + self.ySpeed

    -- Bound ball to screen
    if (self.x < self.radius) then
        self.x = self.radius
        self.xSpeed = self.xSpeed * -1
    end
    if (self.x > love.graphics.getWidth() - self.radius) then
        self.x = love.graphics.getWidth() - self.radius
        self.xSpeed = self.xSpeed * -1
    end
    if (self.y < self.radius) then
        self.y = self.radius
        self.ySpeed = self.ySpeed * -1
    end
    if (self.y > love.graphics.getHeight() - self.radius) then
        self.y = love.graphics.getHeight() - self.radius
        self.ySpeed = self.ySpeed * -1
    end
end

function Ball:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius)
end

return Ball