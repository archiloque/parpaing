class Crossroads < Part
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
        part_name: 'Baseplate 32 x 32 with 6-Stud Crossroads with White Dashed Lines and Crosswalks Print',
        part_code: '44343p03',
        color: Color::DARK_BLUISH_GRAY,
        orientation: Orientation::DEFAULT,
        x: (x + 14.5) * BRICK_WIDTH,
        y: y,
        z: (z + 14.5) * BRICK_WIDTH,
      ),
    ]
  end
end
