local grid = {}

--Create a height x width grid with a RGBA color value
function grid.drawGrid(width, height, cellSize, distanceBetweenCells)
    for y = 1, height, 1 do
        for x = 1, width, 1 do  

            --Single size of a cell
            local singleGridSize = cellSize

            --Distance between each cell
            local singelGridDraw = singleGridSize - distanceBetweenCells

            love.graphics.rectangle('fill', (x + 7) * singleGridSize, (y + 0.5) * singleGridSize, singelGridDraw, singelGridDraw)

            --Set Color Value to each drawn rectangle
            love.graphics.setColor(0.87, 0.87, 0.87, 0.4)
        end
    end
end

return grid