class BrickZ < Brick

  # @param [BrickNumber] z
  def initialize(z)
    super(
      x: 1.to_b,
      y: 1.to_b,
      z: z,
    )
  end
end

class Brick1X2Z < BrickZ

  def initialize()
    super(
      z: 2.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X2,
        color: color,
        orientation: PartOrientation::O_90,
        x: x.number - BRICK_WIDTH,
        y: create_y(y),
        z: z.number + HALF_BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X3Z < BrickZ

  def initialize()
    super(
      z: 3.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X3,
        color: color,
        orientation: PartOrientation::O_90,
        x: x.number - BRICK_WIDTH,
        y: create_y(y),
        z: z.number + (2 * HALF_BRICK_WIDTH),
      ),
    ]
  end
end

class Brick1X4Z < BrickZ

  def initialize()
    super(
      z: 4.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X4,
        color: color,
        orientation: PartOrientation::O_90,
        x: x.number - BRICK_WIDTH,
        y: create_y(y),
        z: z.number + (3 * HALF_BRICK_WIDTH),
      ),
    ]
  end
end

class Brick1X6Z < BrickZ

  def initialize()
    super(
      z: 6.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X6,
        color: color,
        orientation: PartOrientation::O_90,
        x: x.number - BRICK_WIDTH,
        y: create_y(y),
        z: z.number + (5 * HALF_BRICK_WIDTH),
      ),
    ]
  end
end

class Brick1X8Z < BrickZ

  def initialize()
    super(
      z: 8.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X8,
        color: color,
        orientation: PartOrientation::O_90,
        x: x.number - BRICK_WIDTH,
        y: create_y(y),
        z: z.number + (7 * HALF_BRICK_WIDTH),
      ),
    ]
  end
end

class Brick1X10Z < BrickZ

  def initialize()
    super(
      z: 10.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X10,
        color: color,
        orientation: PartOrientation::O_90,
        x: x.number - BRICK_WIDTH,
        y: create_y(y),
        z: z.number + (9 * HALF_BRICK_WIDTH),
      ),
    ]
  end
end

class Brick1X12Z < BrickZ

  def initialize()
    super(
      z: 12.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X12,
        color: color,
        orientation: PartOrientation::O_90,
        x: x.number - BRICK_WIDTH,
        y: create_y(y),
        z: z.number + (11 * HALF_BRICK_WIDTH),
      ),
    ]
  end
end