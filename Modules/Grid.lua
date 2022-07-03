local grid = {}

--Module Declare
local pieceStructures = pieceStructures or require "Modules/Pieces"
local piecesController = require "Modules/PiecesController"

local colors = {
    [' '] = {0.3, 0.3, 0.3}, --Blank Block
    i = {0, 1, 1},
    j = {0, 0, 1},
    l = {1, 0.5, 0},
    o = {1, 1, 0},
    s = {0, 1, 0},
    t = {0.5, 0, 0.5},
    z = {1, 0, 0},
}

--Create a height x width grid with a RGBA color value
function grid.drawGrid(width, height, cellSize, distanceBetweenCells)
    --Draw Grid
    for y = 1, height, 1 do
        for x = 1, width, 1 do  
            --Single size of a cell
            local singleGridSize = cellSize

            --Distance between each cell
            local singelGridDraw = singleGridSize - distanceBetweenCells
            
            --Draw Grid
            love.graphics.rectangle('fill', (x + 7) * singleGridSize, (y + 0.5) * singleGridSize, singelGridDraw, singelGridDraw)
        end
    end

    for y = 1, height, 1 do
        for x = 1, width, 1 do
            grid.DrawBlock(y, x, populate[y][x], cellSize, distanceBetweenCells)
        end
    end

    for y = 1, 4, 1 do
        for x = 1, 4, 1 do
            local block = pieceStructures[pieceType][pieceRotation][y][x]

            if block ~= ' ' then 
            grid.DrawBlock(y + moveY, x + moveX, block, cellSize, distanceBetweenCells)
            end
        end
    end
end

--Populate grid at xPos, yPos
function grid.Populate()
    populate = {}

    for y = 1, GRIDWIDTH, 1 do
        populate[y] = {}
        for x = 1, GRIDHEIGHT, 1 do
            populate[y][x] = ' '
        end
    end
end

function grid.DrawBlock(y, x, block, cellSize, distanceBetweenCells)
    local color = colors[block]

    love.graphics.setColor(color)

    local singleGridSize = cellSize

    local singelGridDraw = singleGridSize - distanceBetweenCells
                
    love.graphics.rectangle('fill', (x + 7) * singleGridSize, (y + 0.5) * singleGridSize, singelGridDraw, singelGridDraw)
end

function grid.ReturnBlankBlock(xPos, yPos)
    if populate[xPos][yPos] ~= ' ' then return false
    else return true
    end
end

return grid