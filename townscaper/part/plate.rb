class Plate < SetPart
  PLATE_1X12 = Part.new('Plate 1 x 12', '60479')
  PLATE_2X12 = Part.new('Plate 2 x 12', '2445')
  PLATE_4X12 = Part.new('Plate 4 x 12', '3029')
  PLATE_6X12 = Part.new('Plate 6 x 12', '3028')

  # @param [MeasurementNumber] y
  # @return [MeasurementNumber]
  def create_y(y)
    (y.number - (STUD_HEIGHT * 3)).to_m
  end

  # @param [MeasurementNumber] z
  # @return [MeasurementNumber]
  def create_z(z)
    (z.number + (11 * HALF_BRICK_WIDTH)).to_m
  end
end

class Plate1X12 < Plate
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: PLATE_1X12,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: create_y(y),
        z: create_z(z),
      ),
    ]
  end
end

class Plate2X12 < Plate
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: PLATE_2X12,
        color: color,
        orientation: PartOrientation::O_90,
        x: (x.number + (HALF_BRICK_WIDTH)).to_m,
        y: create_y(y),
        z: create_z(z),
      ),
    ]
  end
end

class Plate4X12 < Plate
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: PLATE_4X12,
        color: color,
        orientation: PartOrientation::O_90,
        x: (x.number + (3 * HALF_BRICK_WIDTH)).to_m,
        y: create_y(y),
        z: create_z(z),
      ),
    ]
  end
end

class Plate6X12 < Plate
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: PLATE_6X12,
        color: color,
        orientation: PartOrientation::O_90,
        x: (x.number + (5 * HALF_BRICK_WIDTH)).to_m,
        y: create_y(y),
        z: create_z(z),
      ),
    ]
  end
end

class Plate
  BY_SIZE = {
    1 => Plate1X12,
    2 => Plate2X12,
    4 => Plate4X12,
    6 => Plate6X12
  }
end
