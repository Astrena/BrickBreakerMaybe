local Ball = require("ball")
local Paddle = require("paddle")

function love.load()
    Ball:init()
    Paddle:init()
end

function love.update(dt)
    Ball:move()
    Paddle:move()
end

function love.draw()
    Ball:draw()
    Paddle:draw()
end