keyboardBox = {}
keyboardBox.size = 100
keyboardBox.x = love.graphics.getWidth() / 2 - keyboardBox.size / 2
keyboardBox.y = love.graphics.getHeight() / 2 - keyboardBox.size / 2
keyboardBox.speed = 100

mouseBox = {}
mouseBox.size = 100
mouseBox.x = love.graphics.getWidth() / 2 - mouseBox.size / 2
mouseBox.y = love.graphics.getHeight() / 2 - mouseBox.size / 2
mouseBox.speed = 100

function love.load()

end

function love.update(dt)
    mouseBox.x, mouseBox.y = love.mouse.getPosition()

    local dx, dy = 0, 0
    if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        dx = dx - keyboardBox.speed * dt
    end
    if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        dx = dx + keyboardBox.speed * dt
    end
    if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
        dy = dy - keyboardBox.speed * dt
    end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        dy = dy + keyboardBox.speed * dt
    end

    keyboardBox.x = keyboardBox.x + dx
    keyboardBox.y = keyboardBox.y + dy
end

function love.draw()
    love.graphics.setColor(1, 1, 1, 0.25)
    love.graphics.line(mouseBox.x - mouseBox.size / 2, 0, mouseBox.x - mouseBox.size / 2, love.graphics.getHeight())
    love.graphics.line(mouseBox.x + mouseBox.size / 2, 0, mouseBox.x + mouseBox.size / 2, love.graphics.getHeight())
    love.graphics.line(0, mouseBox.y - mouseBox.size / 2, love.graphics.getWidth(), mouseBox.y - mouseBox.size / 2)
    love.graphics.line(0, mouseBox.y + mouseBox.size / 2, love.graphics.getWidth(), mouseBox.y + mouseBox.size / 2)
    love.graphics.setColor(1, 1, 1, 0.5)
    love.graphics.rectangle('line', mouseBox.x - mouseBox.size / 2, mouseBox.y - mouseBox.size / 2, mouseBox.size, mouseBox.size)
    
    love.graphics.setColor(0.5, 0, 0, 1)
    if keyboardBox.x < mouseBox.x + mouseBox.size / 2 then
        love.graphics.setColor(0, 0.5, 0, 1)
    end
    love.graphics.line(keyboardBox.x, 0, keyboardBox.x, love.graphics.getHeight())
    love.graphics.setColor(0.5, 0, 0, 1)

    if keyboardBox.x + keyboardBox.size > mouseBox.x - mouseBox.size / 2 then
        love.graphics.setColor(0, 0.5, 0, 1)
    end
    love.graphics.line(keyboardBox.x + keyboardBox.size, 0, keyboardBox.x + keyboardBox.size, love.graphics.getHeight())
    love.graphics.setColor(0.5, 0, 0, 1)
    
    if keyboardBox.y < mouseBox.y + mouseBox.size / 2 then
        love.graphics.setColor(0, 0.5, 0, 1)
    end
    love.graphics.line(0, keyboardBox.y, love.graphics.getWidth(), keyboardBox.y)
    love.graphics.setColor(0.5, 0, 0, 1)
    
    if keyboardBox.y + keyboardBox.size > mouseBox.y - mouseBox.size / 2 then
        love.graphics.setColor(0, 0.5, 0, 1)
    end
    love.graphics.line(0, keyboardBox.y + keyboardBox.size, love.graphics.getWidth(), keyboardBox.y + keyboardBox.size)
    love.graphics.setColor(0.5, 0, 0, 1)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setLineWidth(1)
    love.graphics.rectangle('line', keyboardBox.x, keyboardBox.y, keyboardBox.size, keyboardBox.size)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end