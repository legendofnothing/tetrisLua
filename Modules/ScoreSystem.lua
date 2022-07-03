local currentScore = 0

function OnLoadScore()
    currentScore = 0
end

function AddScore(level, linesCleared)
    if     (linesCleared == 1) then currentScore = currentScore + 40 * (level) 
    elseif (linesCleared == 2) then currentScore = currentScore + 80 * (level)
    elseif (linesCleared == 3) then currentScore = currentScore + 300 * (level)
    elseif (linesCleared == 4) then currentScore = currentScore + 1200 * (level)
    end
end

function AddPreFixScore(amount)
    currentScore = currentScore + amount
end

function ReturnScore()
    return currentScore
end

return scoreSystem