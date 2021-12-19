class Windows4x3 < Part
  FRAME_4x3 = {
    part_name: 'Window 1 x 4 x 3 without Shutter Tabs',
    part_code: '60594',
  }

  FILLED_PANE_4x3 = {
    part_name: 'Window 1 x 2 x 3 Pane with Thick Corner Tabs',
    part_code: '60608',
  }

  BARRED_PANE_4x3 = {
    part_name: 'Bar 1 x 4 x 3 [End Tabs]',
    part_code: '62113',
  }

  def frame_y(y)
    (y - 3) * BRICK_HEIGHT - STUD_HEIGHT
  end
end

class Windows4x3Front < Windows4x3
  def initialize()
    super(
      x: 4,
      y: 3,
      z: 1,
      )
  end

  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def create_frame(color:, x:, y:, z:)
    Emitter.emit(
      **FRAME_4x3.merge(
        color: color,
        orientation: PartOrientation::Z_180,
        x: (x * BRICK_WIDTH) + 10,
        y: frame_y(y),
        z: z * BRICK_WIDTH,
        )
    )
  end
end

class Windows4x3Back < Windows4x3
  def initialize()
    super(
      x: 4,
      y: 3,
      z: 1,
      )
  end

  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def create_frame(color:, x:, y:, z:)
    Emitter.emit(
      **FRAME_4x3.merge(
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x * BRICK_WIDTH ) + 10,
        y: frame_y(y),
        z: z * BRICK_WIDTH,
        )
    )
  end
end

class Windows4x3Left < Windows4x3
  def initialize()
    super(
      x: 1,
      y: 3,
      z: 4,
      )
  end

  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def create_frame(color:, x:, y:, z:)
    Emitter.emit(
      **FRAME_4x3.merge(
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x - 1) * BRICK_WIDTH,
        y: frame_y(y),
        z: (z + 1.5) * BRICK_WIDTH,
        )
    )
  end
end

class Windows4x3Right < Windows4x3
  def initialize()
    super(
      x: 1,
      y: 3,
      z: 4,
      )
  end

  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def create_frame(color:, x:, y:, z:)
    Emitter.emit(
      **FRAME_4x3.merge(
        color: color,
        orientation: PartOrientation::Z_270,
        x: (x - 1) * BRICK_WIDTH,
        y: frame_y(y),
        z: (z + 1.5) * BRICK_WIDTH,
        )
    )
  end
end
