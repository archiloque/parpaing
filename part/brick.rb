class Brick1X1 < Part
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
        y: ((y - 1) * BRICK_HEIGHT) - STUD_HEIGHT,
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X2Z < Part
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
        y: ((y - 1) * BRICK_HEIGHT) - STUD_HEIGHT,
        z: z * BRICK_WIDTH,
        ),
    ]
  end
  end

class Brick1X3Z < Part
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
        part_name: 'Brick 1 x 3',
        part_code: '3622',
        color: color,
        orientation: Orientation::Z_90,
        x: (x - 1) * BRICK_WIDTH,
        y: ((y - 1) * BRICK_HEIGHT) - STUD_HEIGHT,
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X4Z < Part
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
        y: ((y - 1) * BRICK_HEIGHT) - STUD_HEIGHT,
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X6Z < Part
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
        y: ((y - 1) * BRICK_HEIGHT) - STUD_HEIGHT,
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X8Z < Part
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
        y: ((y - 1) * BRICK_HEIGHT) - STUD_HEIGHT,
        z: (z + 3.5) * BRICK_WIDTH,
      ),
    ]
  end
end

class Brick1X10Z < Part
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
        y: ((y - 1) * BRICK_HEIGHT) - STUD_HEIGHT,
        z: (z + 4.5) * BRICK_WIDTH,
      ),
    ]
  end
end

module Brick
    BY_SIZE = {
      1 => Brick1X1,
      2 => Brick1X2Z,
      3 => Brick1X3Z,
      4 => Brick1X4Z,
      6 => Brick1X6Z,
      8 => Brick1X8Z,
      10 => Brick1X10Z,
    }
end