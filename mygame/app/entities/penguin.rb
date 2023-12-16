
class Penguin < Draco::Entity
  reset
  component PenguinControls
  component Position, x: 600, y: 35
  component Speed, speed: 5
  # component Sprite, w: 44, h: 44, sheet: :penguin, tile: [1,0]
  component Sprite, w: 60, h: 60, sheet: :penguin, tile: [1,0]
  component Animation, animation_name: :penguin_walk_right
end
