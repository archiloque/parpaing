class Windows < OccupyingPart
  FRAME_4x3 = Part.new('Window 1 x 4 x 3 without Shutter Tabs', '60594')
  FILLED_PANE_4x3 = Part.new('Window 1 x 2 x 3 Pane with Thick Corner Tabs', '60608')

  def frame_y(y)
    y - 76.to_u
  end

  def pane_y(y)
    y - 72.to_u
  end
end

class WindowsNorth < Windows
  def initialize()
    super(
      x: 4.to_b,
      y: 3.to_b,
      z: 1.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    pane_z = z - 8.to_u
    [
      Emitter.emit(
        part: FRAME_4x3,
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 30.to_u,
        y: frame_y(y),
        z: z,
      ),
      Emitter.emit(
        part: FILLED_PANE_4x3,
        color: color,
        orientation: PartOrientation::O_90,
        x: x - 2.to_u,
        y: pane_y(y),
        z: pane_z,
      ),
      Emitter.emit(
        part: FILLED_PANE_4x3,
        color: color,
        orientation: PartOrientation::O_270,
        x: x + 62.to_u,
        y: pane_y(y),
        z: pane_z,
      ),
    ]
  end
end

class WindowsSouth < Windows
  def initialize()
    super(
      x: 4.to_b,
      y: 3.to_b,
      z: 1.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    pane_z = z + 8.to_u
    [
      Emitter.emit(
        part: FRAME_4x3,
        color: color,
        orientation: PartOrientation::O_0,
        x: x + 30.to_u,
        y: frame_y(y),
        z: z,
      ),
      Emitter.emit(
        part: FILLED_PANE_4x3,
        color: color,
        orientation: PartOrientation::O_90,
        x: x - 2.to_u,
        y: pane_y(y),
        z: pane_z,
      ),
      Emitter.emit(
        part: FILLED_PANE_4x3,
        color: color,
        orientation: PartOrientation::O_270,
        x: x + 62.to_u,
        y: pane_y(y),
        z: pane_z,
      ),
    ]
  end
end

class WindowsEast < Windows
  def initialize()
    super(
      x: 1.to_b,
      y: 3.to_b,
      z: 4.to_b,
    )
  end

  def create(color:, x:, y:, z:)
    pane_x = x - 6.to_u
    [
      Emitter.emit(
        part: FRAME_4x3,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: frame_y(y),
        z: z + 30.to_u,
      ),
      Emitter.emit(
        part: FILLED_PANE_4x3,
        color: color,
        orientation: PartOrientation::O_180,
        x: pane_x,
        y: pane_y(y),
        z: z - 2.to_u,
      ),
      Emitter.emit(
        part: FILLED_PANE_4x3,
        color: color,
        orientation: PartOrientation::O_0,
        x: pane_x,
        y: pane_y(y),
        z: z + 62.to_u,
      ),
    ]
  end
end

class WindowsWest < Windows
  def initialize()
    super(
      x: 1.to_b,
      y: 3.to_b,
      z: 4.to_b,
      )
  end

  def create(color:, x:, y:, z:)
    pane_x = x + 8.to_u
    [
      Emitter.emit(
        part: FRAME_4x3,
        color: color,
        orientation: PartOrientation::O_270,
        x: x,
        y: frame_y(y),
        z: z + 30.to_u,
        ),
      Emitter.emit(
        part: FILLED_PANE_4x3,
        color: color,
        orientation: PartOrientation::O_180,
        x: pane_x,
        y: pane_y(y),
        z: z - 2.to_u,
        ),
      Emitter.emit(
        part: FILLED_PANE_4x3,
        color: color,
        orientation: PartOrientation::O_0,
        x: pane_x,
        y: pane_y(y),
        z: z + 62.to_u,
        ),
    ]
  end
end
