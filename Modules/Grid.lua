local grid = {}

--Module Declare
local pieceStructures = require "Modules/Pieces"
local piecesController = require "Modules/PiecesController"

local colors = {
    [' '] = {0.87, 0.87, 0.87}, --Blank Block
    i = {0.47, 0.76, 0.94},
    j = {0.93, 0.91, 0.42},
    l = {0.49, 0.85, 0.76},
    o = {0.92, 0.69, 0.47},
    s = {0.83, 0.54, 0.93},
    t = {0.97, 0.58, 0.77},
    z = {0.66, 0.83, 0.46},
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

return grid