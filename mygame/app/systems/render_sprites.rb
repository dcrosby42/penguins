class RenderSprites < Draco::System
  filter Position, Sprite

  def tick(args)
    raise "RENDERSPRITES NIL" if entities.nil?
    sprites = entities.map do |entity|
      sprite = entity.sprite
      spr = {
        x: entity.position.x,
        y: entity.position.y,
        w: sprite.w,
        h: sprite.h,
        # flip_horizontally: sprite.flip_horizontally
      }

      if sprite.sheet
        # special sprite-sheet handling
        spritesheet = SpriteSheets[sprite.sheet]
        if spritesheet
          spr.path = spritesheet.path
          spr.tile_w = spritesheet.tile_w
          spr.tile_h = spritesheet.tile_h
          spr.tile_x = sprite.tile[0]
          spr.tile_y = sprite.tile[1]
        end
      else
        # normal sprite file
        spr.path = sprite.path
      end

      spr
    end

    args.outputs.sprites << sprites
  end
end
