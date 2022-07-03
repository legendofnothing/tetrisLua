local piecesController = {}

moveX = 0
moveY = 0 

local timer = 0
function piecesController.RotatePiece(rotation)
   if rotation == 1 then
    local testRotation = pieceRotation + 1
    if testRotation > #pieceStructures[pieceType] then
        testRotation = 1
    end

    if canPieceMove(moveX, moveY, testRotation) then
        pieceRotation = testRotation
    end
    else
    local testRotation = pieceRotation - 1
    if testRotation < 1 then
        testRotation = #pieceStructures[pieceType]
    end

    if canPieceMove(moveX, moveY, testRotation) then
        pieceRotation = testRotation
    end
    end
end 

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

        else
            piecesController.NewPiece()
        end
    end
end

function piecesController.DropPiece()
    while canPieceMove(moveX, moveY + 1, pieceRotation) do
        moveY = moveY + 1
    end
end

function piecesController.MakePieceFall(dt)
    timer = timer + dt

    if timer >= 1.4 then
        timer = 0
        piecesController.MovePiece(0 , 1)
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