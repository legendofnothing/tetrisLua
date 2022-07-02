--Require Love2D Support extension.

SCREENWIDTH, SCREENHEIGHT = 512, 416

--Start() Unity
function love.load()
    love.window.setMode(SCREENWIDTH, SCREENHEIGHT, {fullscreen = false, centered = true, display = 1})
    love.window.setTitle("tetrisLua")
end




