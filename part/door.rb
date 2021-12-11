class Door < Part
  DOOR_4_PANES = {
    part_name: 'Door 1 x 4 x 5 with 4 Panes',
    part_code: '3861',
  }

  DOOR_FRAME = {
    part_name: 'Door Frame 2 x 4 x 5',
    part_code: '4130',
  }

  DOOR = {
    part_name: 'Door 1 x 4 x 5',
    part_code: '4131',
  }
end

class Door4PanesFront < Door
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
        **DOOR_4_PANES.merge(
          color: color,
          orientation: PartOrientation::Z_90,
          x: (x + 2) * BRICK_WIDTH,
          y: ((y - 5) * BRICK_HEIGHT) - STUD_HEIGHT,
          z: (z * BRICK_WIDTH),
        )
      ),
    ]
  end
end

class Door4PanesBack < Door
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
        **DOOR_4_PANES.merge(
          color: color,
          orientation: PartOrientation::Z_270,
          x: (x - 1) * BRICK_WIDTH,
          y: ((y - 5) * BRICK_HEIGHT) - STUD_HEIGHT,
          z: (z * BRICK_WIDTH),
        )
      ),
    ]
  end
end

class DoorFront < Door
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
        **DOOR_FRAME.merge(
          color: color,
          orientation: PartOrientation::DEFAULT,
          x: (x * BRICK_WIDTH) + 10,
          y: ((y - @y) * BRICK_HEIGHT) - STUD_HEIGHT,
          z: z * BRICK_WIDTH + 10,
        )
      ),
      Emitter.emit(
        **DOOR.merge(
          color: color,
          orientation: PartOrientation::DEFAULT,
          x: (x * BRICK_WIDTH) - 18,
          y: ((y - @y) * BRICK_HEIGHT) + STUD_HEIGHT,
          z: (z * BRICK_WIDTH) - 6,
        )
      ),
    ]
  end
end

class Doorback < Door
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
        **DOOR_FRAME.merge(
          color: color,
          orientation: PartOrientation::DEFAULT,
          x: (x * BRICK_WIDTH) + 10,
          y: ((y - @y) * BRICK_HEIGHT) - STUD_HEIGHT,
          z: z * BRICK_WIDTH - 10,
        )
      ),
      Emitter.emit(
        **DOOR.merge(
          color: color,
          orientation: PartOrientation::DEFAULT,
          x: (x * BRICK_WIDTH) - 18,
          y: ((y - @y) * BRICK_HEIGHT) + STUD_HEIGHT,
          z: (z * BRICK_WIDTH) + 8,
        )
      ),
    ]
  end
end

class Door
  TYPES = [
    {
      front: DoorFront,
      back: Doorback,
    },
    {
      front: Door4PanesFront,
      back: Door4PanesBack,
    }
  ]
end