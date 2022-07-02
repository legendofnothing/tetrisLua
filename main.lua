--Require Love2D Support extension.

--Constant
SCREENWIDTH, SCREENHEIGHT = 512, 416
GRIDWIDTH, GRIDHEIGHT = 18, 10

--Global Vars
pieceRotation = 1
pieceType = nil

--Local Vars


--Module Declare 
grid = grid or require("Modules/Grid")
local pieceStructures = require ("Modules/Pieces")
local piecesController = require ("Modules/PiecesController")

--Love 2D Callback Functions
function love.load()
    love.window.setMode(SCREENWIDTH, SCREENHEIGHT, {fullscreen = false, centered = true, display = 1})
    love.window.setTitle("tetrisLua")

    grid.Populate()
    pieceType = 1
end

function love.draw()
        --Draw Grid (Height, Width, Cell Size, Distance Between Each Cells)
        grid.drawGrid(GRIDHEIGHT, GRIDWIDTH, 20, 2)
end

function love.keypressed(key)
    if key == 'x' then piecesController.RotatePiece(1)

    elseif key == 'z' then piecesController.RotatePiece(-1)
        
    elseif key == "down" then piecesController.MovePiece(0, 1)

    elseif key == "left" then piecesController.MovePiece(-1, 0)

    elseif key == "right" then piecesController.MovePiece(1, 0)

    elseif key == "up" then piecesController.DropPiece()
    end
    
end 

function love.keyreleased(key)
    if key == "down" then isMovingDown = false
    end
end

function love.update(dt)
    piecesController.MakePieceFall(dt)
end






