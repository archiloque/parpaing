class RoadTowardX < Part
  def initialize()
    super(
      x: BASEPLATE_WIDTH,
      y: 1,
      z: BASEPLATE_WIDTH,
      )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Baseplate 32 x 32 with 6-Stud Straight and Road with White Dashed Lines and Storm Drain Print',
        part_code: '44336p04',
        color: Color::DARK_BLUISH_GRAY,
        orientation: Orientation::Z_90,
        x: (x + 15.5) * BRICK_WIDTH,
        y: y,
        z: (z + 14.5) * BRICK_WIDTH,
        ),
    ]
  end
end

class RoadTowardY < Part
  def initialize()
    super(
      x: BASEPLATE_WIDTH,
      y: 1,
      z: BASEPLATE_WIDTH,
      )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Baseplate 32 x 32 with 6-Stud Straight and Road with White Dashed Lines and Storm Drain Print',
        part_code: '44336p04',
        color: Color::DARK_BLUISH_GRAY,
        orientation: Orientation::DEFAULT,
        x: (x + 15.5) * BRICK_WIDTH,
        y: y,
        z: (z + 14.5) * BRICK_WIDTH,
        ),
    ]
  end
end
