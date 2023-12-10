class PenguinController < Draco::System
  filter PenguinControls, Position, Sprite

  def tick(args)
    entities.each do |penguin|
      if args.inputs.left
        penguin.sprite.flip_horizontally = true
      elsif args.inputs.right
        penguin.sprite.flip_horizontally = false
      end

      speed = penguin.speed.speed
      penguin.position.x += args.inputs.left_right * speed
      penguin.position.y += args.inputs.up_down * speed
    end
  end
end
