class Plate < Part
  # @param [Integer] y
  # @return [Integer]
  def create_y(y)
    (y * Part::BRICK_HEIGHT) - (Part::STUD_HEIGHT * 3)
  end

  # @param [Integer] z
  # @return [Integer]
  def create_z(z)
    (z + @z / 2 - 0.5) * BRICK_WIDTH
  end

end

class Plate1X10 < Plate
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
        part_name: 'Plate 1 x 10',
        part_code: '4477',
        color: color,
        orientation: Orientation::Z_90,
        x: (x - 1) * BRICK_WIDTH,
        y: create_y(y),
        z: create_z(z),
      ),
    ]
  end
end

class Plate2X10 < Plate

  def initialize()
    super(
      x: 2,
      y: 1,
      z: 10,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Plate 2 x 10',
        part_code: '3832',
        color: color,
        orientation: Orientation::Z_90,
        x: (x - 0.5) * BRICK_WIDTH,
        y: create_y(y),
        z: create_z(z),
      ),
    ]
  end
end

class Plate4X10 < Plate

  def initialize()
    super(
      x: 4,
      y: 1,
      z: 10,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Plate 4 x 10',
        part_code: '3030',
        color: color,
        orientation: Orientation::Z_90,
        x: (x + 0.5) * BRICK_WIDTH,
        y: create_y(y),
        z: create_z(z),
      ),
    ]
  end
end

class Plate6X10 < Plate

  def initialize()
    super(
      x: 6,
      y: 1,
      z: 10,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Plate 6 x 10',
        part_code: '3033',
        color: color,
        orientation: Orientation::Z_90,
        x: (x + 1.5) * BRICK_WIDTH,
        y: create_y(y),
        z: create_z(z),
      ),
    ]
  end
end

class Plate
  BY_SIZE = {
    1 => Plate1X10,
    2 => Plate2X10,
    4 => Plate4X10,
    6 => Plate6X10
  }
end