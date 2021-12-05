class SingleBrick < Part
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
