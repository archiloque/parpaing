class WindowsFront < Part
  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def create_frame(color:, x:, y:, z:)
    Emitter.emit(
      part_name: 'Window 1 x 4 x 3 without Shutter Tabs',
      part_code: '60594',
      color: color,
      orientation: PartOrientation::Z_180,
      x: (x + 0.5) * BRICK_WIDTH,
      y: (y - @y) * BRICK_HEIGHT - STUD_HEIGHT,
      z: z * BRICK_WIDTH,
    )
  end
end

class WindowsBack < Part
  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def create_frame(color:, x:, y:, z:)
    Emitter.emit(
      part_name: 'Window 1 x 4 x 3 without Shutter Tabs',
      part_code: '60594',
      color: color,
      orientation: PartOrientation::DEFAULT,
      x: (x + 0.5) * BRICK_WIDTH,
      y: (y - @y) * BRICK_HEIGHT - STUD_HEIGHT,
      z: z * BRICK_WIDTH,
    )
  end
end

class Windows1Front < WindowsFront
  def initialize()
    super(
      x: 4,
      y: 3,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    pane_z = (z * BRICK_WIDTH) - 8
    pane_y = (y - @y) * BRICK_HEIGHT - STUD_HEIGHT + 4
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        part_name: 'Window 1 x 2 x 3 Pane with Thick Corner Tabs',
        part_code: '60608',
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x - 1) * BRICK_WIDTH - 2,
        y: pane_y,
        z: pane_z,
      ),
      Emitter.emit(
        part_name: 'Window 1 x 2 x 3 Pane with Thick Corner Tabs',
        part_code: '60608',
        color: color,
        orientation: PartOrientation::Z_270,
        x: (x + 2) * BRICK_WIDTH + 2,
        y: pane_y,
        z: pane_z,
      ),
    ]
  end
end

class Windows1Back < WindowsBack
  def initialize()
    super(
      x: 4,
      y: 3,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    pane_z = (z * BRICK_WIDTH) + 8
    pane_y = (y - @y) * BRICK_HEIGHT - STUD_HEIGHT + 4
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        part_name: 'Window 1 x 2 x 3 Pane with Thick Corner Tabs',
        part_code: '60608',
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x - 1) * BRICK_WIDTH - 2,
        y: pane_y,
        z: pane_z,
      ),
      Emitter.emit(
        part_name: 'Window 1 x 2 x 3 Pane with Thick Corner Tabs',
        part_code: '60608',
        color: color,
        orientation: PartOrientation::Z_270,
        x: (x + 2) * BRICK_WIDTH + 2,
        y: pane_y,
        z: pane_z,
      ),
    ]
  end
end

class Windows2Front < WindowsBack
  def initialize()
    super(
      x: 4,
      y: 3,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    pane_z = (z * BRICK_WIDTH) - 8
    pane_y = (y - @y) * BRICK_HEIGHT - STUD_HEIGHT + 4
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        part_name: 'Window 1 x 2 x 3 Pane Latticed with Thick Corner Tabs',
        part_code: '60607',
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x - 1) * BRICK_WIDTH - 2,
        y: pane_y,
        z: pane_z,
      ),
      Emitter.emit(
        part_name: 'Window 1 x 2 x 3 Pane Latticed with Thick Corner Tabs',
        part_code: '60607',
        color: color,
        orientation: PartOrientation::Z_270,
        x: (x + 2) * BRICK_WIDTH + 2,
        y: pane_y,
        z: pane_z,
      ),
    ]
  end
end

class Windows2Back < WindowsBack
  def initialize()
    super(
      x: 4,
      y: 3,
      z: 1,
      )
  end

  def create(color:, x:, y:, z:)
    pane_z = (z * BRICK_WIDTH) + 8
    pane_y = (y - @y) * BRICK_HEIGHT - STUD_HEIGHT + 4
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        part_name: 'Window 1 x 2 x 3 Pane Latticed with Thick Corner Tabs',
        part_code: '60607',
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x - 1) * BRICK_WIDTH - 2,
        y: pane_y,
        z: pane_z,
        ),
      Emitter.emit(
        part_name: 'Window 1 x 2 x 3 Pane Latticed with Thick Corner Tabs',
        part_code: '60607',
        color: color,
        orientation: PartOrientation::Z_270,
        x: (x + 2) * BRICK_WIDTH + 2,
        y: pane_y,
        z: pane_z,
        ),
    ]
  end
end

class Windows3Front < WindowsFront
  def initialize()
    super(
      x: 4,
      y: 3,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        part_name: 'Bar 1 x 4 x 3 [End Tabs]',
        part_code: '62113',
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: x * BRICK_WIDTH + 10,
        y: (y - @y) * BRICK_HEIGHT + 30,
        z: (z * BRICK_WIDTH) - 8,
      ),
    ]
  end
end

class Windows3Back < WindowsBack
  def initialize()
    super(
      x: 4,
      y: 3,
      z: 1,
      )
  end

  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        part_name: 'Bar 1 x 4 x 3 [End Tabs]',
        part_code: '62113',
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: x * BRICK_WIDTH + 10,
        y: (y - @y) * BRICK_HEIGHT + 30,
        z: (z * BRICK_WIDTH) + 6,
        ),
    ]
  end
  end

module Windows
  TYPES = [
    {
      front: Windows1Front,
      back: Windows1Back,
    },
    {
      front: Windows2Front,
      back: Windows2Back,
    },
    {
      front: Windows3Front,
      back: Windows3Back,
    },
  ]
end