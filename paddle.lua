local Paddle = {}

function Paddle:init()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() - 50
    self.xSpeed = 0
    self.height = 6
    self.width = 40
end

function Paddle:move()
    -- Set paddle speed
    self.xSpeed = 0
    if (love.keyboard.isDown('right')) then
        self.xSpeed = self.xSpeed + 5
    end
    if (love.keyboard.isDown('left')) then
        self.xSpeed = self.xSpeed - 5
    end

    -- Move paddle
    self.x = self.x + self.xSpeed

    -- Bound paddle to screen
    if (self.x < 0) then
        self.x = 0
    end
    if (self.x > love.graphics.getWidth() - self.width) then
        self.x = love.graphics.getWidth() - self.width
    end
end

function Paddle:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Paddle