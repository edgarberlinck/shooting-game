local Math = {}
Math.distanceBetween = function(x1, y1, x2, y2)
  return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

Math.percentageOf = function(value, percentage)
  return (percentage / value) * 100
end

return Math
