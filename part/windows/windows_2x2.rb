class Windows2x2 < Part
  FLAT_FRONT_2x2 = {
    part_name: 'Window 1 x 2 x 2 Flat Front',
    part_code: '60592',
  }

  BARS_2x2 = {
    part_name: 'Bars For Window 1 x 2 x 2',
    part_code: '38320',
  }

  GLASS_2x2 = {
    part_name: 'Glass for Window 1 x 2 x 2 Flat',
    part_code: '60601',
  }

  def frame_y(y)
    (y - 2) * BRICK_HEIGHT - STUD_HEIGHT
  end

  def pane_y(y)
    (y - 3) * Part::BRICK_HEIGHT + 20
  end
end

class Windows2x2Front < Windows2x2
  # @param [Color, nil] color
  # @param [Hash] part
  def initialize(color, part)
    super(
      x: 2,
      y: 2,
      z: 1,
    )
    @color = color
    @part = part
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        **FLAT_FRONT_2x2.merge(
          color: color,
          orientation: PartOrientation::DEFAULT,
          x: (x * BRICK_WIDTH) - 10,
          y: frame_y(y),
          z: (z * BRICK_WIDTH),
        )
      ),
      Emitter.emit(
        **@part.merge(
          color: (@color || color),
          orientation: PartOrientation::DEFAULT,
          x: (x * BRICK_WIDTH) - 10,
          y: pane_y(y),
          z: (z * BRICK_WIDTH),
        )
      ),
    ]
  end

end

class Windows2x2Back < Windows2x2
  # @param [Color, nil] color
  # @param [Hash] part
  def initialize(color, part)
    super(
      x: 2,
      y: 2,
      z: 1,
    )
    @color = color
    @part = part
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        **FLAT_FRONT_2x2.merge(
          color: color,
          orientation: PartOrientation::Z_180,
          x: (x * BRICK_WIDTH) - 10,
          y: frame_y(y),
          z: z * BRICK_WIDTH,
        )
      ),
      Emitter.emit(
        **@part.merge(
          color: (@color || color),
          orientation: PartOrientation::DEFAULT,
          x: (x * BRICK_WIDTH) - 10,
          y: pane_y(y),
          z: (z * BRICK_WIDTH) + 10,
        )
      ),
    ]
  end

end

class Windows2x2Left < Windows2x2
  # @param [Color, nil] color
  # @param [Hash] part
  def initialize(color, part)
    super(
      x: 1,
      y: 2,
      z: 2,
    )
    @color = color
    @part = part
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        **FLAT_FRONT_2x2.merge(
          color: color,
          orientation: PartOrientation::Z_270,
          x: (x - 1) * BRICK_WIDTH,
          y: frame_y(y),
          z: (z + 0.5) * BRICK_WIDTH,
        )
      ),
      Emitter.emit(
        **@part.merge(
          color: (@color || color),
          orientation: PartOrientation::Z_90,
          x: ((x - 1) * BRICK_WIDTH) - 10,
          y: pane_y(y),
          z: (z * BRICK_WIDTH) + 10,
        )
      ),
    ]
  end

end

class Windows2x2Right < Windows2x2
  # @param [Color, nil] color
  # @param [Hash] part
  def initialize(color, part)
    super(
      x: 1,
      y: 2,
      z: 2,
    )
    @color = color
    @part = part
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        **FLAT_FRONT_2x2.merge(
          color: color,
          orientation: PartOrientation::Z_90,
          x: (x - 1) * BRICK_WIDTH,
          y: frame_y(y),
          z: (z + 0.5) * BRICK_WIDTH,
        )
      ),
      Emitter.emit(
        **@part.merge(
          color: (@color || color),
          orientation: PartOrientation::Z_270,
          x: ((x - 1) * BRICK_WIDTH) + 10,
          y: pane_y(y),
          z: (z * BRICK_WIDTH) + 10,
        )
      ),
    ]
  end
end
