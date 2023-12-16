require "app/lib/draco"

require "app/sprite_sheets"
require "app/animations"

# Components
require "app/components/animated.rb"
require "app/components/animation.rb"
require "app/components/label.rb"
require "app/components/penguin_controls.rb"
require "app/components/position.rb"
require "app/components/speed.rb"
require "app/components/sprite.rb"
require "app/components/velocity.rb"

# Systems
# require "app/systems/animate.rb"
require "app/systems/animation_system.rb"
# require "app/systems/cleanup_animations.rb"
require "app/systems/penguin_controller.rb"
require "app/systems/render_labels.rb"
require "app/systems/render_sprites.rb"

# Entities
require "app/entities/penguin.rb"

# Worlds
# require "app/worlds/title_screen.rb"
require "app/worlds/penguin_game.rb"

require "app/penguin_sheet_tester"

def tick args
  args.state.worlds ||= {
    game: PenguinGame.new,
    sheet: PenguinSheetTester.new,
  }
  args.state.world ||= args.state.worlds[:game]

  if args.inputs.keyboard.key_down.one
    args.state.world = args.state.worlds[:game]
  elsif args.inputs.keyboard.key_down.two
    args.state.world = args.state.worlds[:sheet]
  end

  args.state.world.tick(args)

  handle_reset args
end

def handle_reset(args)
  if args.inputs.keyboard.key_down.r
    $gtk.reset
  end
end
