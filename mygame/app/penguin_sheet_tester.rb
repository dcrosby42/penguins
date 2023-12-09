class PenguinSheetTester
  PENGUIN_SHEET = "sprites/penguin-sheet-01.png"
  PENGUIN_SHEET_HEIGHT = 2048
  PENGUIN_SHEET_WIDTH = 2048

  Sequences = {
    walk_sideview: [[0, 1], [0, 2], [0, 3], [0, 5], [0, 6], [0, 7]],
  }

  # sheet: filename tile_w tile_h
  # sequence: [[r,c],[r,c]...]
  # frame_func t,fcount -> fi
  # [seq, dir=forward|reverse|rando, continue=loop|stay|reset|pong]]

  # mk_fps_func = (fps) => (t,size) => (t * (fps / 60.0)).round % size

  def animate(args)
    scale = 0.5 # 0.35
    tile_h = 128
    tile_w = 128

    args.state.anim ||= {}
    anim = args.state.anim
    anim.t ||= 0
    anim.fps ||= 12
    anim.sequence_name ||= :walk_sideview
    anim.playing = false if anim.playing.nil?
    anim.flip_h = false if anim.flip_h.nil?

    fps = anim.fps
    if args.inputs.keyboard.key_down.equal_sign
      fps += 1
    end
    if args.inputs.keyboard.key_down.minus
      fps -= 1
    end
    fps = fps.clamp(0, 60)
    if fps != anim.fps
      anim.fps = fps
      anim.t = 0
    end
    if args.inputs.keyboard.key_down.space
      anim.playing = !anim.playing
    end

    if args.inputs.keyboard.key_down.f
      anim.flip_h = !anim.flip_h
    end
    if anim.playing
      anim.t += 1
    else
      if args.inputs.keyboard.key_down.open_square_brace
        anim.t -= (60 / anim.fps).round
      end
      if args.inputs.keyboard.key_down.close_square_brace
        anim.t += (60 / anim.fps).round
      end
      anim.t = 0 if anim.t < 0
    end

    seq = Sequences[anim.sequence_name]
    frame = (anim.t * (anim.fps / 60)).round % seq.size

    row, col = seq[frame]

    tile_x = col * tile_w
    tile_y = row * tile_h
    args.outputs.sprites << {
      x: 20,
      y: args.grid.h - 20 - (scale * tile_h),
      w: (tile_w * scale).round,
      h: (tile_h * scale).round,
      path: PENGUIN_SHEET,
      tile_x: tile_x,
      tile_y: tile_y,
      tile_w: tile_w,
      tile_h: tile_h,
      flip_horizontally: anim.flip_h,
    }

    args.outputs.labels << { x: 0,
                             y: args.grid.h,
                             text: "#{anim.sequence_name}[#{frame}] @ #{anim.fps} fps" }
  end

  def tick(args)
    animate(args)

    args.state.sheet_explorer ||= {
      row: 0,
      col: 0,
      sequence_name: :walk_sideview,
    # playing: true,
    # fps: 1,
    # counter: 0,
    }
    # args.state.sequence ||= :walk_sideview

    se = args.state.sheet_explorer

    # args.inputs.keyboard.key_down.z
    if args.inputs.keyboard.key_down.left
      se.col -= 1
      se.col = 0 if se.col < 0
    end
    if args.inputs.keyboard.key_down.right
      se.col += 1
      se.col = 15 if se.col > 15
    end
    if args.inputs.keyboard.key_down.up
      se.row -= 1
      se.row = 0 if se.row < 0
    end
    if args.inputs.keyboard.key_down.down
      se.row += 1
      se.row = 15 if se.row > 15
    end

    #
    # Tile preview
    #
    tile_h = 128
    tile_w = 128
    col = se.col
    row = se.row
    tile_x = col * tile_w
    tile_y = row * tile_h
    scale = 0.35
    # scale = 0.125
    args.outputs.sprites << {
      x: 20,
      y: 20,
      w: (tile_w * scale).round,
      h: (tile_h * scale).round,
      path: PENGUIN_SHEET,
      tile_x: tile_x,
      tile_y: tile_y,
      tile_w: tile_w,
      tile_h: tile_h,
    }

    args.outputs.labels << { x: 20,
                             y: 90,
                             #  text: "col=#{col} row=#{row}" ,
                             text: "[#{row},#{col}]" }
    args.outputs.labels << { x: 20,
                             y: 110,
                             text: "Tile" }

    #
    # Sheet preview
    #
    # sheet tile backlight:
    aleft = args.grid.w - 720
    abottom = 0
    atop = abottom + (PENGUIN_SHEET_HEIGHT * scale)
    args.outputs.solids << {
      x: aleft + (tile_x * scale),
      y: atop - (tile_h * scale) - (tile_y * scale),
      w: 128 * scale,
      h: 128 * scale,
      r: 255,
      g: 128,
      b: 128,
    }

    # sheet image:
    args.outputs.sprites << {
      x: aleft,
      y: abottom,
      w: PENGUIN_SHEET_WIDTH * scale,
      h: PENGUIN_SHEET_HEIGHT * scale,
      path: PENGUIN_SHEET,
    }

    # walk_backview = [[5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5]]

    #  size_enum: 1,
    #  alignment_enum: 1 }
  end
end
