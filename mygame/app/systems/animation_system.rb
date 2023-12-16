class AnimationSystem < Draco::System
  filter Animation, Sprite

  def tick(args)
    entities.each do |entity|
      entity.animation.current_frame += 1
      anim = Animations[entity.animation.animation_name]
      # args.outputs.labels << [0,20,"Dude"]
      if anim
        frame = select_frame_by_tick(anim.frames, entity.animation.current_frame)
        if anim.sheet
          entity.sprite.sheet = anim.sheet
          entity.sprite.tile = frame.tile
          
        else
          entity.sprite.path = frame.path
        end
      end
    end
  end

  def select_frame_by_tick(frames,ticks)
    total_frames = frames.reduce(0) { |total, frame| total + frame[:frames] }
    current_frame = ticks % total_frames
  
    # See where current_frame falls on the timeline of frame objects:
    t = 0
    frames.each do |frame|
      if current_frame >= t && current_frame < (t + frame[:frames])
        # the anim's current frame num falls in this section of the timeline
        return frame
      end
      t += frame[:frames]
    end
    # off the end. return the final frame
    return frames.last
  end
end
