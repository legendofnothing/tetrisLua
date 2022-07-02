--Require Love2D Support extension.

--Constant
SCREENWIDTH, SCREENHEIGHT = 512, 416

--Love 2D Callback Functions
function love.load()
    love.window.setMode(SCREENWIDTH, SCREENHEIGHT, {fullscreen = false, centered = true, display = 1})
    love.window.setTitle("tetrisLua")
end

function love.update(dt)
    
end




