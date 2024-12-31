function love.load()
    maxBallSpeed = 20
    maxStartSpeed = 5
    ball = {}
    ball.x = love.graphics.getWidth() / 2
    ball.y = love.graphics.getHeight() / 2
    ball.xSpeed = love.math.random(-maxStartSpeed, maxStartSpeed)
    ball.ySpeed = love.math.random(-maxStartSpeed, maxStartSpeed)
    ball.radius = 6

    paddle = {}
    paddle.x = love.graphics.getWidth() / 2
    paddle.y = love.graphics.getHeight() - 50
    paddle.xSpeed = 0
    paddle.height = 6
    paddle.width = 40
end

function love.update(dt)
    -- Move ball
    ball.x = ball.x + ball.xSpeed
    ball.y = ball.y + ball.ySpeed

    -- Bound ball to screen
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

    -- Set paddle speed
    paddle.xSpeed = 0
    if (love.keyboard.isDown('right')) then
        paddle.xSpeed = paddle.xSpeed + 5
    end
    if (love.keyboard.isDown('left')) then
        paddle.xSpeed = paddle.xSpeed - 5
    end

    -- Move paddle
    paddle.x = paddle.x + paddle.xSpeed

    -- Bound paddle to screen
    if (paddle.x < 0) then
        paddle.x = 0
    end
    if (paddle.x > love.graphics.getWidth() - paddle.width) then
        paddle.x = love.graphics.getWidth() - paddle.width
    end
end

function love.draw()
    love.graphics.circle("fill", ball.x, ball.y, ball.radius)
    love.graphics.rectangle("fill", paddle.x, paddle.y, paddle.width, paddle.height)
end