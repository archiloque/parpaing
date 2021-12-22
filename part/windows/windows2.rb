module Windows2
  include Measures
  def pane_y(y)
    (y - 3) * BRICK_HEIGHT + 30
  end
end

class Windows2Front < Windows4x3Front
  include Windows2

  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        part: BARRED_PANE_4x3,
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x * BRICK_WIDTH) + 10,
        y: pane_y(y),
        z: (z * BRICK_WIDTH) - 8,
      ),
    ]
  end
end

class Windows2Back < Windows4x3Back
  include Windows2

  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        part: BARRED_PANE_4x3,
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x * BRICK_WIDTH) + 10,
        y: pane_y(y),
        z: (z * BRICK_WIDTH) + 6,
      ),
    ]
  end
end

class Windows2Left < Windows4x3Left
  include Windows2

  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        part: BARRED_PANE_4x3,
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x * BRICK_WIDTH) - 26,
        y: pane_y(y),
        z: (z * BRICK_WIDTH) + 30,
      ),
    ]
  end
end

class Windows2Right < Windows4x3Right
  include Windows2

  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        part: BARRED_PANE_4x3,
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x * BRICK_WIDTH) - 14,
        y: pane_y(y),
        z: (z * BRICK_WIDTH) + 30,
      ),
    ]
  end
end
