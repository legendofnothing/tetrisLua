--Require Love2D Support extension.

--Constant
SCREENWIDTH, SCREENHEIGHT = 512, 416
GRIDWIDTH, GRIDHEIGHT = 18, 10

--Global Vars
pieceRotation = 1
pieceType = 2

DELAY = 2
LEVEL = 1

--Local Vars
local score = 0 

--Module Declare 
grid = grid or require("Modules/Grid")
local pieceStructures = require ("Modules/Pieces")
local piecesController = require ("Modules/PiecesController")
local levelSystem = require ("Modules/LevelSystem")

--Love 2D Callback Functions
function love.load()
    love.window.setMode(SCREENWIDTH, SCREENHEIGHT, {fullscreen = false, centered = true, display = 1})
    love.window.setTitle("tetrisLua")

    grid.Populate()

    piecesController.NewSequence()
    piecesController.NewPiece()

    OnLoadScore()
    levelSystem.OnLevelSystemLoad()
end

function love.draw()
    --Draw Grid (Height, Width, Cell Size, Distance Between Each Cells)
    grid.drawGrid(GRIDHEIGHT, GRIDWIDTH, 20, 2)    

    love.graphics.print(score, 20, 250)
    love.graphics.print(LEVEL, 20, 200)
end

function love.keypressed(key)
    if key == 'x' then piecesController.RotatePiece(1)

    elseif key == 'z' then piecesController.RotatePiece(-1)

    elseif key == "left" then piecesController.MovePiece(-1, 0)

    elseif key == "right" then piecesController.MovePiece(1, 0)

    elseif key == "up" then piecesController.DropPiece()
    end
    
end 

function love.update(dt)
    levelSystem.IncreaseLevel()

    piecesController.MakePieceFall(dt)

    score = ReturnScore()

    local softdropTimer = 0
    if love.keyboard.isDown('s') then 
        softdropTimer = softdropTimer + (dt * 100)

        if(softdropTimer >= 1.1) then 
            softdropTimer = 1.1
            piecesController.MovePiece(0, 1)
        end

    else softdropTimer = 0 end 
end







