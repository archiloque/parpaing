class Brick < OccupyingPart
  # @param [MeasurementNumber] y
  # @return [MeasurementNumber]
  def create_y(y)
    (y.number - BRICK_HEIGHT - STUD_HEIGHT).to_m
  end

  BRICK_1X1 = Part.new('Brick 1 x 2', '3005')
  BRICK_1X2 = Part.new('Brick 1 x 2', '3004')
  BRICK_1X3 = Part.new('Brick 1 x 3', '3622')
  BRICK_1X4 = Part.new('Brick 1 x 4', '3010')
  BRICK_1X6 = Part.new('Brick 1 x 6', '3009')
  BRICK_1X8 = Part.new('Brick 1 x 8', '3008')
  BRICK_1X10 = Part.new('Brick 1 x 10', '6111')
  BRICK_1X12 = Part.new('Brick 1 x 12', '6112')
end

class Brick1X1 < Brick

  def initialize()
    super(
      x: 1.to_b,
      y: 1.to_b,
      z: 1.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: BRICK_1X1,
        color: color,
        orientation: PartOrientation::O_0,
        x: x,
        y: create_y(y),
        z: z,
      ),
    ]
  end
end

require_relative 'brick_x'
require_relative 'brick_z'

class Brick
  BY_SIZE_Z = {
    1 => Brick1X1,
    2 => Brick1X2Z,
    3 => Brick1X3Z,
    4 => Brick1X4Z,
    6 => Brick1X6Z,
    8 => Brick1X8Z,
    10 => Brick1X10Z,
    12 => Brick1X12Z,
  }
  BY_SIZE_X = {
    1 => Brick1X1,
    2 => Brick1X2X,
    3 => Brick1X3X,
    4 => Brick1X4X,
    6 => Brick1X6X,
    8 => Brick1X8X,
    10 => Brick1X10X,
    12 => Brick1X12X,
  }
end