class Door4Panes < Part
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
        x: (x + 2) * BRICK_WIDTH,
        y: ((y - 5) * BRICK_HEIGHT) - STUD_HEIGHT,
        z: z,
      ),
    ]
  end
end

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
        part_name: 'Door Frame 2 x 4 x 5',
        part_code: '4130',
        color: color,
        orientation: Orientation::DEFAULT,
        x: (x * BRICK_WIDTH) + 10,
        y: ((y - @y) * BRICK_HEIGHT) - STUD_HEIGHT,
        z: z * BRICK_WIDTH + 10,
        ),
      Emitter.emit(
        part_name: 'Door 1 x 4 x 5',
        part_code: '4131',
        color: color,
        orientation: Orientation::DEFAULT,
        x: (x * BRICK_WIDTH) - 19,
        y: ((y - @y) * BRICK_HEIGHT) + STUD_HEIGHT,
        z: (z  * BRICK_WIDTH) - 16,
        ),
    ]
  end
end

module Doors
  TYPES = [
    Door,
    Door4Panes,
  ]
end