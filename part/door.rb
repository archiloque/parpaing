class Door < SetPart
  DOOR_4_PANES = Part.new('Door 1 x 4 x 5 with 4 Panes', '3861')
  DOOR_FRAME = Part.new('Door Frame 2 x 4 x 5', '4130')
  DOOR = Part.new('Door 1 x 4 x 5', '4131')
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
        part: DOOR_4_PANES,
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x * BRICK_WIDTH) + 40,
        y: (y * BRICK_HEIGHT) - 124,
        z: (z * BRICK_WIDTH),
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
        part: DOOR_4_PANES,
        color: color,
        orientation: PartOrientation::Z_270,
        x: (x * BRICK_WIDTH) - 20,
        y: (y * BRICK_HEIGHT) - 124,
        z: (z * BRICK_WIDTH),
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
        part: DOOR_FRAME,
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x * BRICK_WIDTH) + 10,
        y: (y * BRICK_HEIGHT) - 124,
        z: z * BRICK_WIDTH + 10,
      ),
      Emitter.emit(
        part: DOOR,
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x * BRICK_WIDTH) - 18,
        y: (y * BRICK_HEIGHT) - 116,
        z: (z * BRICK_WIDTH) - 6,
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
        part: DOOR_FRAME,
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x * BRICK_WIDTH) + 10,
        y: (y * BRICK_HEIGHT) - 124,
        z: z * BRICK_WIDTH - 10,
      ),
      Emitter.emit(
        part: DOOR,
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x * BRICK_WIDTH) - 18,
        y: (y * BRICK_HEIGHT) - 116,
        z: (z * BRICK_WIDTH) + 8,
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