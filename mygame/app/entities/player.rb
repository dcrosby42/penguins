class Player < Draco::Entity
  reset
  # component Destroyable
  component PlayerControlled
  component Position, x: 600, y: 35
  component Speed, speed: 5
  component Sprite, w: 44, h: 44, sheet: :penguin, tile: [0,1]
  
  TPF = 30 # ticks per frame
  component Animated, frames: [
    {frames: TPF, tile: [1,0]},
    {frames: TPF, tile: [2,0]},
    {frames: TPF, tile: [3,0]},
    {frames: TPF, tile: [5,0]},
    {frames: TPF, tile: [6,0]},
    {frames: TPF, tile: [7,0]},
  ]
end