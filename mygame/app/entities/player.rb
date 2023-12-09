class Player < Draco::Entity
  # component Destroyable
  component PlayerControlled
  component Position, x: 600, y: 35
  component Speed, speed: 5
  component Sprite, w: 44, h: 44, sheet: :penguin, tile: [0,1]
end