class BasePlate < SetPart

  PLATE_CROSSROADS = Part.new('Baseplate 32 x 32 with 6-Stud Crossroads with White Dashed Lines and Crosswalks Print', '44343p03')
  PLATE_ROAD = Part.new('Baseplate 32 x 32 with 6-Stud Straight and Road with White Dashed Lines and Storm Drain Print', '44336p04')
  PLATE_GREEN = Part.new('Baseplate 32 x 32', '3811')

  def initialize()
    super(
      x: BASEPLATE_WIDTH,
      y: 1,
      z: BASEPLATE_WIDTH,
    )
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [Hash]
  def create_position(x:, y:, z:)
    {
      x: (x + 14.5) * BRICK_WIDTH,
      y: (y * BRICK_HEIGHT) - STUD_HEIGHT,
      z: (z + 15.5) * BRICK_WIDTH,
    }
  end
end

class GreenBasePlate < BasePlate
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        **{
          part: PLATE_GREEN,
          color: Color::GREEN,
          orientation: PartOrientation::DEFAULT,
        }.merge(create_position(x: x, y: y, z: z))
      )
    ]
  end
end

class Crossroads < BasePlate
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        **{
          part: PLATE_CROSSROADS,
          color: Color::DARK_BLUISH_GRAY,
          orientation: PartOrientation::DEFAULT,
        }.merge(create_position(x: x, y: y, z: z))
      ),
    ]
  end
end

class RoadTowardX < BasePlate
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        **{
          part: PLATE_ROAD,
          color: Color::DARK_BLUISH_GRAY,
          orientation: PartOrientation::Z_90,
        }.merge(create_position(x: x, y: y, z: z))
      ),
    ]
  end
end

class RoadTowardZ < BasePlate
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        **{
          part: PLATE_ROAD,
          color: Color::DARK_BLUISH_GRAY,
          orientation: PartOrientation::DEFAULT,
        }.merge(create_position(x: x, y: y, z: z))
      ),
    ]
  end
end
