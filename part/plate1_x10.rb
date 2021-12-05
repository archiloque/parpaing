class Plate1X10 < Part
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
        y: (y * BRICK_HEIGHT) - (STUD_HEIGHT * 2),
        z: (z + @z / 2 - 0.5) * BRICK_WIDTH,
      ),
    ]
  end
end
