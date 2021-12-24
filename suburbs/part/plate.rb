class Plate < SetPart
  PLATE_1x10 = Part.new('Plate 1 x 10', '4477')
  PLATE_2x10 = Part.new('Plate 2 x 10', '3832')
  PLATE_4x10 = Part.new('Plate 4 x 10', '3030')
  PLATE_6x10 = Part.new('Plate 6 x 10', '3033')
  # @param [Integer] y
  # @return [Integer]
  def create_y(y)
    (y * BRICK_HEIGHT) - (STUD_HEIGHT * 3)
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
        part: PLATE_1x10,
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x * BRICK_WIDTH) - 20,
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
        part: PLATE_2x10,
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x * BRICK_WIDTH) - 10,
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
        part: PLATE_4x10,
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x * BRICK_WIDTH) + 10,
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
        part: PLATE_6x10,
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x * BRICK_WIDTH) + 30,
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
