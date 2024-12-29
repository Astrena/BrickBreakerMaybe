function love.load()
    maxBallSpeed = 20
    maxStartSpeed = 5
    ball = {}
    ball.x = love.graphics.getWidth() / 2
    ball.y = love.graphics.getHeight() / 2
    ball.xSpeed = love.math.random(-maxStartSpeed, maxStartSpeed)
    ball.ySpeed = love.math.random(-maxStartSpeed, maxStartSpeed)
    ball.radius = 6
end

function love.update(dt)
    ball.x = ball.x + ball.xSpeed
    ball.y = ball.y + ball.ySpeed

    if (ball.x < ball.radius) then
        ball.x = ball.radius
        ball.xSpeed = ball.xSpeed * -1
    end
    if (ball.x > love.graphics.getWidth() - ball.radius) then
        ball.x = love.graphics.getWidth() - ball.radius
        ball.xSpeed = ball.xSpeed * -1
    end
    if (ball.y < ball.radius) then
        ball.y = ball.radius
        ball.ySpeed = ball.ySpeed * -1
    end
    if (ball.y > love.graphics.getHeight() - ball.radius) then
        ball.y = love.graphics.getHeight() - ball.radius
        ball.ySpeed = ball.ySpeed * -1
    end
end

function love.draw()
    love.graphics.circle("fill", ball.x, ball.y, ball.radius)
end