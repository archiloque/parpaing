class BrickZ < Brick

  # @param [NumberOfBrick] z
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
      2.to_b,
    )
  end

  # @param [Color] color
  # @param [UnitNumber] x
  # @param [UnitNumber] y
  # @param [UnitNumber] z
  # @param [Brick::Part] part
  # @return [Array<String>]
  def inner_create(color:, x:, y:, z:, part:)
    [
      Emitter.emit(
        part: part,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: create_y(y),
        z: z + (HALF_BRICK_WIDTH * 1),
      ),
    ]
  end

  def create(color:, x:, y:, z:)
    inner_create(
      color: color,
      x: x,
      y: y,
      z: z,
      part: BRICK_1X2
    )
  end
end

class Brick1X3Z < BrickZ

  def initialize()
    super(
      3.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X3,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: create_y(y),
        z: z + (HALF_BRICK_WIDTH * 2),
      ),
    ]
  end
end

class Brick1X4Z < BrickZ

  def initialize()
    super(
      4.to_b,
    )
  end

  # @param [Color] color
  # @param [UnitNumber] x
  # @param [UnitNumber] y
  # @param [UnitNumber] z
  # @param [Brick::Part] part
  # @return [Array<String>]
  def inner_create(color:, x:, y:, z:, part:)
    [
      Emitter.emit(
        part: part,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: create_y(y),
        z: z + (HALF_BRICK_WIDTH * 3),
      ),
    ]
  end

  def create(color:, x:, y:, z:)
    inner_create(
      color: color,
      x: x,
      y: y,
      z: z,
      part: BRICK_1X4
    )
  end
end

class Brick1X6Z < BrickZ

  def initialize()
    super(
      6.to_b,
    )
  end

  # @return [Part]
  def part
    BRICK_1X6
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: part,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: create_y(y),
        z: z + (HALF_BRICK_WIDTH * 5),
      ),
    ]
  end
end

class Brick1X8Z < BrickZ

  def initialize()
    super(
      8.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X8,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: create_y(y),
        z: z + (HALF_BRICK_WIDTH * 7),
      ),
    ]
  end
end

class Brick1X10Z < BrickZ

  def initialize()
    super(
      10.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X10,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: create_y(y),
        z: z + (HALF_BRICK_WIDTH * 9),
      ),
    ]
  end
end

class Brick1X12Z < BrickZ

  def initialize()
    super(
      12.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X12,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: create_y(y),
        z: z + (HALF_BRICK_WIDTH * 11),
      ),
    ]
  end
end
