class PenguinController < Draco::System
  filter PenguinControls, Position, Sprite

  def tick(args)
    entities.each do |penguin|
      update_sprite_dir(args,penguin)
      update_animation(args,penguin)
      update_position(args,penguin)
    end
  end
      
  def update_sprite_dir(args,penguin)
    if args.inputs.left
      penguin.sprite.flip_horizontally = true
    elsif args.inputs.right
      penguin.sprite.flip_horizontally = false
    end
  end

  def update_animation(args,penguin)
    anim = penguin.animation
    if args.inputs.left_right == 0 and args.inputs.up_down == 0
      name = :penguin_stand_right
      if anim.animation_name != name
        anim.animation_name = name
        anim.current_frame = 0
      end
    else
      name = :penguin_walk_right
      if anim.animation_name != name
        anim.animation_name = name
        anim.current_frame = 0
      end
    end
    
  end
  

  def update_position(args,penguin)
    speed = penguin.speed.speed
    penguin.position.x += args.inputs.left_right * speed
    penguin.position.y += args.inputs.up_down * speed
  end
end
