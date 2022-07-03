local levelSystem = {}

local linesUntilNextLevel = 10
local linesCleared = 0
local delayDecrease = 0.2

function levelSystem.OnLevelSystemLoad()
    linesUntilNextLevel = 10
    linesCleared = 0
    delayDecrease = 0.2
end

function levelSystem.IncreaseLevel()
    if (LEVEL > 4) then
        linesUntilNextLevel = linesUntilNextLevel * LEVEL
        delayDecrease = 0.1
    end

    if (LEVEL > 14) then
        delayDecrease = 0.05
    end

    if linesCleared == linesUntilNextLevel then 
        LEVEL = LEVEL + 1
        DELAY = DELAY - delayDecrease

        linesCleared = 0
    end
end

function IncreaseLineClearedThreshold(amount)
    linesCleared = linesCleared + amount
end

return levelSystem