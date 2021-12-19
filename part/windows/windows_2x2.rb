class Windows2x2 < Part
  FLAT_FRONT_2x2 = {
    part_name: 'Window 1 x 2 x 2 Flat Front',
    part_code: '60592',
  }

  BARS_2x2 = {
    part_name: 'Bars For Window 1 x 2 x 2',
    part_code: '38320',
  }

  def frame_y(y)
    (y - 2) * BRICK_HEIGHT - STUD_HEIGHT
  end
end

class Windows2x2Front < Windows2x2
  def initialize()
    super(
      x: 2,
      y: 2,
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
      **FLAT_FRONT_2x2.merge(
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x * BRICK_WIDTH) - 10,
        y: frame_y(y),
        z: z * BRICK_WIDTH,
        )
    )
  end
end

class Windows2x2Back < Windows2x2
  def initialize()
    super(
      x: 2,
      y: 2,
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
      **FLAT_FRONT_2x2.merge(
        color: color,
        orientation: PartOrientation::Z_180,
        x: (x * BRICK_WIDTH ) - 10,
        y: frame_y(y),
        z: z * BRICK_WIDTH,
        )
    )
  end
end

class Windows2x2Left < Windows2x2
  def initialize()
    super(
      x: 1,
      y: 2,
      z: 2,
      )
  end

  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def create_frame(color:, x:, y:, z:)
    Emitter.emit(
      **FLAT_FRONT_2x2.merge(
        color: color,
        orientation: PartOrientation::Z_270,
        x: (x - 1) * BRICK_WIDTH,
        y: frame_y(y),
        z: (z + 0.5) * BRICK_WIDTH,
        )
    )
  end
end

class Windows2x2Right < Windows2x2
  def initialize()
    super(
      x: 1,
      y: 2,
      z: 2,
      )
  end

  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def create_frame(color:, x:, y:, z:)
    Emitter.emit(
      **FLAT_FRONT_2x2.merge(
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x - 1) * BRICK_WIDTH,
        y: frame_y(y),
        z: (z + 0.5) * BRICK_WIDTH,
        )
    )
  end
end