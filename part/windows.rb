class Windows < Part
  FRAME = {
    part_name: 'Window 1 x 4 x 3 without Shutter Tabs',
    part_code: '60594',
  }

  FILLED_PANE = {
    part_name: 'Window 1 x 2 x 3 Pane with Thick Corner Tabs',
    part_code: '60608',
  }

  BARRED_PANE = {
    part_name: 'Bar 1 x 4 x 3 [End Tabs]',
    part_code: '62113',
  }
end

class WindowsFront < Windows
  def initialize()
    super(
      x: 4,
      y: 3,
      z: 1,
    )
  end

  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def create_frame(color:, x:, y:, z:)
    Emitter.emit(
      **FRAME.merge(
        part_code: '60594',
        color: color,
        orientation: PartOrientation::Z_180,
        x: (x + 0.5) * BRICK_WIDTH,
        y: (y - 3) * BRICK_HEIGHT - STUD_HEIGHT,
        z: z * BRICK_WIDTH,
      )
    )
  end
end

class WindowsBack < Windows
  def initialize()
    super(
      x: 4,
      y: 3,
      z: 1,
    )
  end

  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def create_frame(color:, x:, y:, z:)
    Emitter.emit(
      **FRAME.merge(
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x + 0.5) * BRICK_WIDTH,
        y: (y - 3) * BRICK_HEIGHT - STUD_HEIGHT,
        z: z * BRICK_WIDTH,
      )
    )
  end
end

class WindowsLeft < Windows
  def initialize()
    super(
      x: 1,
      y: 3,
      z: 4,
    )
  end

  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def create_frame(color:, x:, y:, z:)
    Emitter.emit(
      **FRAME.merge(
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x - 1) * BRICK_WIDTH,
        y: (y - 3) * BRICK_HEIGHT - STUD_HEIGHT,
        z: (z + 1.5) * BRICK_WIDTH,
      )
    )
  end
end

class WindowsRight < Windows
  def initialize()
    super(
      x: 1,
      y: 3,
      z: 4,
    )
  end

  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def create_frame(color:, x:, y:, z:)
    Emitter.emit(
      **FRAME.merge(
        color: color,
        orientation: PartOrientation::Z_270,
        x: (x - 1) * BRICK_WIDTH,
        y: (y - 3) * BRICK_HEIGHT - STUD_HEIGHT,
        z: (z + 1.5) * BRICK_WIDTH,
      )
    )
  end
end

class Windows1Front < WindowsFront
  def create(color:, x:, y:, z:)
    pane_z = (z * BRICK_WIDTH) - 8
    pane_y = (y - 3) * BRICK_HEIGHT
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **FILLED_PANE.merge(
          color: color,
          orientation: PartOrientation::Z_90,
          x: (x - 1) * BRICK_WIDTH - 2,
          y: pane_y,
          z: pane_z,
        )
      ),
      Emitter.emit(
        **FILLED_PANE.merge(
          color: color,
          orientation: PartOrientation::Z_270,
          x: (x + 2) * BRICK_WIDTH + 2,
          y: pane_y,
          z: pane_z,
        )
      ),
    ]
  end
end

class Windows1Back < WindowsBack
  def create(color:, x:, y:, z:)
    pane_z = (z * BRICK_WIDTH) + 8
    pane_y = (y - 3) * BRICK_HEIGHT
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **FILLED_PANE.merge(
          color: color,
          orientation: PartOrientation::Z_90,
          x: (x - 1) * BRICK_WIDTH - 2,
          y: pane_y,
          z: pane_z,
        )
      ),
      Emitter.emit(
        **FILLED_PANE.merge(
          color: color,
          orientation: PartOrientation::Z_270,
          x: (x + 2) * BRICK_WIDTH + 2,
          y: pane_y,
          z: pane_z,
        )
      ),
    ]
  end
end

class Windows1Left < WindowsLeft
  def create(color:, x:, y:, z:)
    pane_x = (x - 1) * BRICK_WIDTH - 6
    pane_y = (y - 3) * BRICK_HEIGHT
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **FILLED_PANE.merge(
          color: color,
          orientation: PartOrientation::Z_180,
          x: pane_x,
          y: pane_y,
          z: z * BRICK_WIDTH - 2,
        )
      ),
      Emitter.emit(
        **FILLED_PANE.merge(
          color: color,
          orientation: PartOrientation::DEFAULT,
          x: pane_x,
          y: pane_y,
          z: (z + 3) * BRICK_WIDTH + 2,
        )
      ),
    ]
  end
end

class Windows1Right < WindowsRight
  def create(color:, x:, y:, z:)
    pane_x = (x - 1) * BRICK_WIDTH + 6
    pane_y = (y - 3) * BRICK_HEIGHT
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **FILLED_PANE.merge(
          color: color,
          orientation: PartOrientation::Z_180,
          x: pane_x,
          y: pane_y,
          z: z * BRICK_WIDTH - 2,
        )
      ),
      Emitter.emit(
        **FILLED_PANE.merge(
          color: color,
          orientation: PartOrientation::DEFAULT,
          x: pane_x,
          y: pane_y,
          z: (z + 3) * BRICK_WIDTH + 2,
        )
      ),
    ]
  end
end

class Windows2Front < WindowsFront
  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **BARRED_PANE.merge(
          color: color,
          orientation: PartOrientation::DEFAULT,
          x: x * BRICK_WIDTH + 10,
          y: (y - 3) * BRICK_HEIGHT + 30,
          z: (z * BRICK_WIDTH) - 8,
        )
      ),
    ]
  end
end

class Windows2Back < WindowsBack
  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **BARRED_PANE.merge(
          color: color,
          orientation: PartOrientation::DEFAULT,
          x: x * BRICK_WIDTH + 10,
          y: (y - 3) * BRICK_HEIGHT + 30,
          z: (z * BRICK_WIDTH) + 6,
        )
      ),
    ]
  end
end

class Windows2Left < WindowsLeft
  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **BARRED_PANE.merge(
          color: color,
          orientation: PartOrientation::Z_90,
          x: (x - 1) * BRICK_WIDTH - 6,
          y: (y - 3) * BRICK_HEIGHT + 30,
          z: (z * BRICK_WIDTH) + 30,
        )
      ),
    ]
  end
end

class Windows2Right < WindowsRight
  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **BARRED_PANE.merge(
          color: color,
          orientation: PartOrientation::Z_90,
          x: (x - 1) * BRICK_WIDTH + 6,
          y: (y - 3) * BRICK_HEIGHT + 30,
          z: (z * BRICK_WIDTH) + 30,
        )
      ),
    ]
  end
end

class Windows
  TYPES = [
    {
      front: Windows1Front,
      back: Windows1Back,
      left: Windows1Left,
      right: Windows1Right,
    },
    {
      front: Windows2Front,
      back: Windows2Back,
      left: Windows2Left,
      right: Windows2Right,
    },
  ]
end