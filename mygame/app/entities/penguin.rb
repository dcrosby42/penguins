
class Penguin < Draco::Entity
  reset
  component PenguinControls
  component Position, x: 600, y: 35
  # component Velocity
  component Speed, speed: 5
  component Sprite, w: 44, h: 44, sheet: :penguin, tile: [1,0]
  
  TPF = 5 # ticks per frame
  component Animated, frames: [
    {frames: TPF, tile: [1,0]},
    {frames: TPF, tile: [2,0]},
    {frames: TPF, tile: [3,0]},
    {frames: TPF, tile: [5,0]},
    {frames: TPF, tile: [6,0]},
    {frames: TPF, tile: [7,0]},
  ]
end
