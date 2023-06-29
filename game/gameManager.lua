local GameSprites = require('game/spritesManager')
local Constants = require('game/constants')

GameColors = {
  green = function() return 0, 1, 0 end,
  red = function() return 1, 0, 0 end,
  white = function() return 1, 1, 1 end,
  yellow = function() return 250 / 255, 250 / 255, 210 / 2550 end,
}

GameFont = {
  default = function()
    return love.graphics.newFont(30)
  end
}

GameState = {
  OnMenu = 1,
  OnGame = 2
}

GameManager = {
  state = GameState.OnMenu,
  score = 0,
  timer = 0,
  currentTarget = {
    x = 250,
    y = 250
  }
}

GameElements = {
  drawTarget = function(x, y)
    love.graphics.draw(
      GameSprites.target,
      GameManager.currentTarget.x - Constants.colisionCircle.radius,
      GameManager.currentTarget.y - Constants.colisionCircle.radius
    )
  end,

  drawScore = function()
    love.graphics.setFont(GameFont.default())
    love.graphics.setColor(GameColors.white())
    love.graphics.printf("Score: " .. GameManager.score, 5, 0, love.graphics.getWidth(), "left")
  end,

  drawTimer = function()
    love.graphics.setFont(GameFont.default())
    love.graphics.setColor(GameColors.white())
    love.graphics.printf("Time left: " .. string.format("%.2f", GameManager.timer), 0, 0, love.graphics.getWidth(),
      "center")
  end,

  drawCrosshairs = function()
    love.graphics.setColor(GameColors.yellow())
    love.graphics.draw(GameSprites.crosshairs, love.mouse.getX() - 20, love.mouse.getY() - 20)
  end,

  drawBackbround = function()
    love.graphics.setColor(GameColors.white())
    love.graphics.draw(GameSprites.background, 0, 0)
  end,

  drawMenu = function()
    love.graphics.printf(
      "Click anyware to start", 0, 250,
      love.graphics.getWidth(),
      "center"
    )
  end
}

return GameManager
