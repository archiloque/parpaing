class Brick < Part
  # @param [Integer] y
  # @return [Integer]
  def create_y(y)
    ((y - 1) * BRICK_HEIGHT) - STUD_HEIGHT
  end
end

class Brick1X1 < Brick

  def initialize()
    super(
      x: 1,
      y: 1,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 1',
        part_code: '3005',
        color: color,
        orientation: Orientation::DEFAULT,
        x: (x - 1) * BRICK_WIDTH,
        y: create_y(y),
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X2X < Brick

  def initialize()
    super(
      x: 2,
      y: 1,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 2',
        part_code: '3004',
        color: color,
        orientation: Orientation::DEFAULT,
        x: (x - 0.5) * BRICK_WIDTH,
        y: create_y(y),
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X2Z < Brick

  def initialize()
    super(
      x: 1,
      y: 1,
      z: 2,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 2',
        part_code: '3004',
        color: color,
        orientation: Orientation::Z_90,
        x: (x - 1) * BRICK_WIDTH,
        y: create_y(y),
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X3X < Brick

  def initialize()
    super(
      x: 3,
      y: 1,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 3',
        part_code: '3622',
        color: color,
        orientation: Orientation::DEFAULT,
        x: x * BRICK_WIDTH,
        y: create_y(y),
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X3Z < Brick

  def initialize()
    super(
      x: 1,
      y: 1,
      z: 3,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 3',
        part_code: '3622',
        color: color,
        orientation: Orientation::Z_90,
        x: (x - 1) * BRICK_WIDTH,
        y: create_y(y),
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X4X < Brick

  def initialize()
    super(
      x: 4,
      y: 1,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 4',
        part_code: '3010',
        color: color,
        orientation: Orientation::DEFAULT,
        x: (x + 0.5) * BRICK_WIDTH,
        y: create_y(y),
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X4Z < Brick

  def initialize()
    super(
      x: 1,
      y: 1,
      z: 4,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 4',
        part_code: '3010',
        color: color,
        orientation: Orientation::Z_90,
        x: (x - 1) * BRICK_WIDTH,
        y: create_y(y),
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X6X < Brick

  def initialize()
    super(
      x: 6,
      y: 1,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 6',
        part_code: '3009',
        color: color,
        orientation: Orientation::DEFAULT,
        x: (x + 1.5) * BRICK_WIDTH,
        y: create_y(y),
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X6Z < Brick

  def initialize()
    super(
      x: 1,
      y: 1,
      z: 6,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 6',
        part_code: '3009',
        color: color,
        orientation: Orientation::Z_90,
        x: (x - 1) * BRICK_WIDTH,
        y: create_y(y),
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X8X < Brick

  def initialize()
    super(
      x: 8,
      y: 1,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 8',
        part_code: '3008',
        color: color,
        orientation: Orientation::DEFAULT,
        x: (x + 2.5) * BRICK_WIDTH,
        y: create_y(y),
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X8Z < Brick

  def initialize()
    super(
      x: 1,
      y: 1,
      z: 8,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 8',
        part_code: '3008',
        color: color,
        orientation: Orientation::Z_90,
        x: (x - 1) * BRICK_WIDTH,
        y: create_y(y),
        z: (z + 3.5) * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X10X < Brick

  def initialize()
    super(
      x: 10,
      y: 1,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 10',
        part_code: '6111',
        color: color,
        orientation: Orientation::DEFAULT,
        x: (x + 3.5) * BRICK_WIDTH,
        y: create_y(y),
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X10Z < Brick

  def initialize()
    super(
      x: 1,
      y: 1,
      z: 10,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Brick 1 x 10',
        part_code: '6111',
        color: color,
        orientation: Orientation::Z_90,
        x: (x - 1) * BRICK_WIDTH,
        y: create_y(y),
        z: (z + 4.5) * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick
  BY_SIZE_Z = {
    1 => Brick1X1,
    2 => Brick1X2Z,
    3 => Brick1X3Z,
    4 => Brick1X4Z,
    6 => Brick1X6Z,
    8 => Brick1X8Z,
    10 => Brick1X10Z,
  }
  BY_SIZE_X = {
    1 => Brick1X1,
    2 => Brick1X2X,
    3 => Brick1X3X,
    4 => Brick1X4X,
    6 => Brick1X6X,
    8 => Brick1X8X,
    10 => Brick1X10X,
  }
end