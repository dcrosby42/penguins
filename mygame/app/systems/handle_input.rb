class HandleInput < Draco::System
  reset
  filter PlayerControlled, Position, Speed

  def tick(args)
    entities.each do |entity|
      speed = entity.speed.speed

      entity.position.x += args.inputs.left_right * speed
      entity.position.y += args.inputs.up_down * speed
    end
  end
end
