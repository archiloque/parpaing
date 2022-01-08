class BrickX < Brick

  # @param [BrickNumber] x
  def initialize(x)
    super(
      x: x,
      y: 1.to_b,
      z: 1.to_b,
      )
  end
  end

class Brick1X2X < BrickX

  def initialize()
    super(
      x: 2.to_b,
      )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X2,
        color: color,
        orientation: PartOrientation::O_0,
        x: x.number - HALF_BRICK_WIDTH,
        y: create_y(y),
        z: z.number,
        ),
    ]
  end
end

class Brick1X3X < BrickX

  def initialize()
    super(
      x: 3.to_b,
      )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X3,
        color: color,
        orientation: PartOrientation::O_0,
        x: x.number - (2 * HALF_BRICK_WIDTH),
        y: create_y(y),
        z: z.number,
        ),
    ]
  end
end

class Brick1X4X < BrickX

  def initialize()
    super(
      x: 4.to_b,
      )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X4,
        color: color,
        orientation: PartOrientation::O_0,
        x: x.number - (3 * HALF_BRICK_WIDTH),
        y: create_y(y),
        z: z.number,
        ),
    ]
  end
end

class Brick1X6X < BrickX

  def initialize()
    super(
      x: 6.to_b,
      )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X6,
        color: color,
        orientation: PartOrientation::O_0,
        x: x.number - (3 * HALF_BRICK_WIDTH),
        y: create_y(y),
        z: z.number,
        ),
    ]
  end
end


class Brick1X8X < BrickX

  def initialize()
    super(
      x: 8.to_b,
      )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X8,
        color: color,
        orientation: PartOrientation::O_0,
        x: x.number - (5 * HALF_BRICK_WIDTH),
        y: create_y(y),
        z: z.number,
        ),
    ]
  end
end


class Brick1X10X < BrickX

  def initialize()
    super(
      x: 10.to_b,
      )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X10,
        color: color,
        orientation: PartOrientation::O_0,
        x: x.number - (7 * HALF_BRICK_WIDTH),
        y: create_y(y),
        z: z.number,
        ),
    ]
  end
end

class Brick1X12X < BrickX

  def initialize()
    super(
      x: 12.to_b,
      )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X10,
        color: color,
        orientation: PartOrientation::O_0,
        x: x.number - (9 * HALF_BRICK_WIDTH),
        y: create_y(y),
        z: z.number,
        ),
    ]
  end
end
