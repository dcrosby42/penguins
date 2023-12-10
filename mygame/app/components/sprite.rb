class Sprite < Draco::Component
  attribute :path
  attribute :w
  attribute :h

  attribute :sheet
  attribute :tile

  attribute :flip_horizontally, default: false
  attribute :flip_vertically, default: false
end
