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
local isPausing = false

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
    grid.drawGrid(GRIDHEIGHT, GRIDWIDTH, 20, 1.3)    

    love.graphics.setColor(1,1,1)
    local scoreText = "Score - "..score
    local levelText = "Level - "..LEVEL

    love.graphics.print(scoreText, 20, 230)
    love.graphics.print(levelText, 20, 180)

    if isPausing then love.graphics.print("Paused", 20, 140) end
end

function love.keypressed(key)
    if isPausing == false then
        if key == 'x' then piecesController.RotatePiece(1)

        elseif key == 'z' then piecesController.RotatePiece(-1)
    
        elseif key == "left" then piecesController.MovePiece(-1, 0)
    
        elseif key == "right" then piecesController.MovePiece(1, 0)
    
        elseif key == "up" then piecesController.DropPiece() 

        elseif key == "escape" then isPausing = true

        elseif key == "r" then love.load() end
    else
        if key == "escape" then isPausing = false end
    end

end
    
function love.update(dt)

    if isPausing == false then
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
end









