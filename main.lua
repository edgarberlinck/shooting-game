local GameManager = require('game/GameManager')
local Math = require('utils.Math')
local Constants = require('game.constants')

function love.load()
  GameManager.timer = 0
  love.mouse.setVisible(false)
end

-- runs at around 60 fps
function love.update(deltaTimer)
  if GameManager.state == GameState.OnGame then
    if (GameManager.timer > 0) then
      GameManager.timer = GameManager.timer - deltaTimer
    end

    if GameManager.timer < 0 then
      GameManager.timer = 0
      GameManager.state = GameState.OnMenu
    end
  end
end

-- runs every single frame
function love.draw()
  GameElements.drawBackbround()
  GameElements.drawScore()
  GameElements.drawTimer()
  if (GameManager.state == GameState.OnMenu) then
    GameElements.drawMenu()
  end
  if (GameManager.state == GameState.OnGame) then
    GameElements.drawTarget(GameManager.currentTarget.x, GameManager.currentTarget.y)
  end
  GameElements.drawCrosshairs()
end

-- Binding events
function love.mousepressed(x, y, button, istouch, presses)
  if button == Constants.mouseButtons.LEFT and GameManager.state == GameState.OnMenu then
    GameManager.state = GameState.OnGame
    GameManager.timer = 10
    GameManager.score = 0
  end

  if button == Constants.mouseButtons.LEFT and GameManager.state == GameState.OnGame then
    local mouseToTarget = Math.distanceBetween(x, y, GameManager.currentTarget.x, GameManager.currentTarget.y)
    if (mouseToTarget < Constants.colisionCircle.radius) then
      GameManager.score = GameManager.score + 1
      GameManager.timer = GameManager.timer + 0.5
      GameManager.currentTarget.x = math.random(Constants.colisionCircle.radius,
        love.graphics.getWidth() - Constants.colisionCircle.radius)
      GameManager.currentTarget.y = math.random(Constants.colisionCircle.radius,
        love.graphics.getHeight() - Constants.colisionCircle.radius)
    else
      if (GameManager.score > 0) then
        GameManager.score = GameManager.score - 1
      end
    end
  end
end
