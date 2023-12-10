class Animate < Draco::System
  filter Animated, Sprite

  def tick(args)
    entities.each do |entity|
      entity.animated.current_frame += 1
      frame = get_current_frame(entity.animated)
      if frame.path
        entity.sprite.path = frame.path
      elsif frame.tile
        entity.sprite.tile = frame.tile
      end
    end
  end

  def get_current_frame(animated)
    total_frames = animated.frames.reduce(0) { |total, frame| total + frame[:frames] }
    current_frame = animated.current_frame % total_frames
  
    # See where current_frame falls on the timeline of frame objects:
    t = 0
    animated.frames.each do |frame|
      if current_frame >= t && current_frame < (t + frame[:frames])
        # the anim's current frame num falls in this section of the timeline
        return frame
      end
      t += frame[:frames]
    end
    # off the end. return the final frame
    return animated.frames.last
  end
end
