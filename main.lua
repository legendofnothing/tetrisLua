--Require Love2D Support extension.

--Constant
SCREENWIDTH, SCREENHEIGHT = 512, 416

--Module Declare 
local grid = require("Modules/Grid")

--Love 2D Callback Functions
function love.load()
    love.window.setMode(SCREENWIDTH, SCREENHEIGHT, {fullscreen = false, centered = true, display = 1})
    love.window.setTitle("tetrisLua")

end

function love.draw()
        --Draw Grid (Height, Width, Cell Size, Distance Between Each Cells)
        grid.drawGrid(10, 18, 20, 2)
end

function love.update(dt)
    
end




