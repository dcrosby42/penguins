class SpriteSheet < Draco::Component
  attribute :path
  attribute :tile_w
  attribute :tile_h
end

SpriteSheets = {
  penguin: SpriteSheet.new(
    path: "sprites/penguin-sheet-01.png",
    tile_w: 128,
    tile_h: 128,
  ),
}