class RenderSprites < Draco::System
  filter Position, Sprite

  def tick(args)
    return if entities.nil?
    labels = []
    sprites = entities.map do |entity|
      sprite = entity.sprite
      spr = {
        x: entity.position.x,
        y: entity.position.y,
        w: sprite.w,
        h: sprite.h,
        flip_horizontally: sprite.flip_horizontally,
        flip_vertically: sprite.flip_vertically,
      }

      if sprite.sheet
        # special sprite-sheet handling
        spritesheet = SpriteSheets[sprite.sheet]
        if spritesheet
          spr.path = spritesheet.path
          spr.tile_x = sprite.tile[0] * spritesheet.tile_w
          spr.tile_y = sprite.tile[1] * spritesheet.tile_h
          spr.tile_w = spritesheet.tile_w
          spr.tile_h = spritesheet.tile_h
        end
      else
        # normal sprite file
        spr.path = sprite.path
      end

      labels << [entity.position.x,entity.position.y,"#{sprite}",-1]
      spr
    end

    args.outputs.sprites << sprites
    args.outputs.labels << labels
  end
end
