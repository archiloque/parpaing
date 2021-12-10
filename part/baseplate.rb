class BasePlate < Part
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
          part_name: 'Baseplate 32 x 32',
          part_code: '3811',
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
          part_name: 'Baseplate 32 x 32 with 6-Stud Crossroads with White Dashed Lines and Crosswalks Print',
          part_code: '44343p03',
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
          part_name: 'Baseplate 32 x 32 with 6-Stud Straight and Road with White Dashed Lines and Storm Drain Print',
          part_code: '44336p04',
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
          part_name: 'Baseplate 32 x 32 with 6-Stud Straight and Road with White Dashed Lines and Storm Drain Print',
          part_code: '44336p04',
          color: Color::DARK_BLUISH_GRAY,
          orientation: PartOrientation::DEFAULT,
        }.merge(create_position(x: x, y: y, z: z))
      ),
    ]
  end
end
