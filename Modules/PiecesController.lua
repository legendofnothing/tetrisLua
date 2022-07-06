local piecesController = {}

--Global Vars
moveX = 0
moveY = 0 

--Module Declaration
local scoreSystem = require ("Modules/ScoreSystem")

--Local Vars
local timer = 0

--Rotate Piece Function
function piecesController.RotatePiece(rotation)
    --Rotate Right
    if rotation == 1 then

        local testRotation = pieceRotation + 1
    
        if testRotation > #pieceStructures[pieceType] then testRotation = 1 end

        if canPieceMove(moveX, moveY, testRotation) then pieceRotation = testRotation end

    --Rotate Left
    else
        
        local testRotation = pieceRotation - 1

        if testRotation < 1 then testRotation = #pieceStructures[pieceType] end

        if canPieceMove(moveX, moveY, testRotation) then pieceRotation = testRotation end
    end
end 

--Move Piece Function
function piecesController.MovePiece(x, y)
    if y == 0 
    then

        if x > 0 then 
            local testX = moveX + 1

            if canPieceMove(testX, moveY, pieceRotation) then
                moveX = testX
            end

        elseif x < 0 then 
            local testX = moveX - 1

            if canPieceMove(testX, moveY, pieceRotation) then
                moveX = testX
            end

        end
    else 
        local testY = moveY + 1

        if canPieceMove(moveX, testY, pieceRotation) then
            moveY = testY
            AddPreFixScore(1)

        else timer = DELAY
        end
    end
end

function piecesController.DropPiece()
    while canPieceMove(moveX, moveY + 1, pieceRotation) do
        moveY = moveY + 1
        timer = DELAY

        AddPreFixScore(2)
    end
end

function piecesController.MakePieceFall(dt)
    timer = timer + dt

    if timer >= DELAY then
        timer = 0

        local testY = moveY + 1
        
        if canPieceMove(moveX, testY, pieceRotation) then
            moveY = testY

        else
            for y = 1, 4, 1 do
                for x = 1, 4, 1 do 

                    local block = pieceStructures[pieceType][pieceRotation][y][x]

                    if block ~= ' ' then populate[moveY + y][moveX + x] = block end
                end
            end

            local linesCleared = 0

            for y = 1, 18, 1 do 
                local lineFilled = true 

                for x = 1, 10, 1 do
                    if populate[y][x] == ' ' then lineFilled = false break end
                end

                if lineFilled == true then
                    linesCleared = linesCleared + 1

                    for removeLineY = y, 2, -1 do 
                        for removeLineX = 1, 10, 1 do
                            populate[removeLineY][removeLineX] = populate[removeLineY - 1][removeLineX]
                        end
                    end

                    for removeLineX = 1, 10, 1 do 
                        populate[1][removeLineX] = ' '
                    end
                end
            end

            AddScore(LEVEL, linesCleared)
            IncreaseLineClearedThreshold(linesCleared)
            piecesController.NewPiece()

            if not canPieceMove(moveX, moveY, pieceRotation) then love.load() end 
        end
    end
end

function piecesController.NewSequence()
    sequence = {}

    for pieceTypeIndex = 1 , #pieceStructures do
        local position = love.math.random(#sequence + 1)

        table.insert(sequence, position, pieceTypeIndex)

    end

    print(table.concat(sequence, ' '))

end

function piecesController.NewPiece()
    moveX = 3
    moveY = 0
    pieceType = table.remove(sequence)
    pieceRotation = 1

    if #sequence == 0 then piecesController.NewSequence() end 
end

function canPieceMove(testX, testY, testRotation)
    for y = 1, 4, 1 do
        for x = 1, 4, 1 do
            if pieceStructures[pieceType][testRotation][y][x] ~= ' ' and ((testX + x) < 1 or (testX + x) > GRIDHEIGHT or (testY + y) > GRIDWIDTH  or populate[testY + y][testX + x] ~= ' ') then
                return false
            end
        end
    end

    return true
end

--Im really noob at high level languages so im just duplicating this from Grid.lua
local function Populate()
    populate = {}

    for y = 1, GRIDWIDTH, 1 do
        populate[y] = {}
        for x = 1, GRIDHEIGHT, 1 do
            populate[y][x] = ' '
        end
    end
end

return piecesController