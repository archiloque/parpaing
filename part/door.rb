class Door < Part
  def initialize()
    super(
      x: 4,
      y: 5,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Door 1 x 4 x 5 with 4 Panes',
        part_code: '3861',
        color: color,
        orientation: Orientation::Z_90,
        x: (x + @x - 2) * BRICK_WIDTH,
        y: ((y - @y) * BRICK_HEIGHT) - STUD_HEIGHT,
        z: z,
      ),
    ]
  end
end
