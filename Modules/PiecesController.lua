local piecesController = {}

moveX = 0
moveY = 0 

function piecesController.RotatePiece(rotation)
    pieceRotation = pieceRotation + rotation

    if pieceRotation > #pieceStructures[pieceType] then
        pieceRotation = 1
    end

    if pieceRotation < 1 then
        pieceRotation = #pieceStructures[pieceType]
    end
end

function piecesController.MovePiece(x, y)
    moveX = moveX + x
    moveY = moveY + y
end

function piecesController.MakePieceFall(dt)
    timer = timer + dt

    if timer >= 0.5 then
        timer = 0
        piecesController.MovePiece(0 , 1)
    end
end

return piecesController