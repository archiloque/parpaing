module Windows1
  def pane_y(y)
    (y - 3) * Part::BRICK_HEIGHT
  end
end

class Windows1Front < Windows4x3Front
  include Windows1

  def create(color:, x:, y:, z:)
    pane_z = (z * BRICK_WIDTH) - 8
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **FILLED_PANE_4x3.merge(
          color: color,
          orientation: PartOrientation::Z_90,
          x: (x * BRICK_WIDTH) - 22,
          y: pane_y(y),
          z: pane_z,
        )
      ),
      Emitter.emit(
        **FILLED_PANE_4x3.merge(
          color: color,
          orientation: PartOrientation::Z_270,
          x: (x * BRICK_WIDTH) + 42,
          y: pane_y(y),
          z: pane_z,
        )
      ),
    ]
  end
end

class Windows1Back < Windows4x3Back
  include Windows1

  def create(color:, x:, y:, z:)
    pane_z = (z * BRICK_WIDTH) + 8
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **FILLED_PANE_4x3.merge(
          color: color,
          orientation: PartOrientation::Z_90,
          x: (x * BRICK_WIDTH) - 22,
          y: pane_y(y),
          z: pane_z,
        )
      ),
      Emitter.emit(
        **FILLED_PANE_4x3.merge(
          color: color,
          orientation: PartOrientation::Z_270,
          x: (x * BRICK_WIDTH) + 42,
          y: pane_y(y),
          z: pane_z,
        )
      ),
    ]
  end
end

class Windows1Left < Windows4x3Left
  include Windows1

  def create(color:, x:, y:, z:)
    pane_x = (x * BRICK_WIDTH) - 26
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **FILLED_PANE_4x3.merge(
          color: color,
          orientation: PartOrientation::Z_180,
          x: pane_x,
          y: pane_y(y),
          z: (z * BRICK_WIDTH) - 2,
        )
      ),
      Emitter.emit(
        **FILLED_PANE_4x3.merge(
          color: color,
          orientation: PartOrientation::DEFAULT,
          x: pane_x,
          y: pane_y(y),
          z: (z * BRICK_WIDTH) + 62,
        )
      ),
    ]
  end
end

class Windows1Right < Windows4x3Right
  include Windows1

  def create(color:, x:, y:, z:)
    pane_x = (x * BRICK_WIDTH) + 14
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **FILLED_PANE_4x3.merge(
          color: color,
          orientation: PartOrientation::Z_180,
          x: pane_x,
          y: pane_y(y),
          z: (z * BRICK_WIDTH) - 2,
        )
      ),
      Emitter.emit(
        **FILLED_PANE_4x3.merge(
          color: color,
          orientation: PartOrientation::DEFAULT,
          x: pane_x,
          y: pane_y(y),
          z: (z + 3) * BRICK_WIDTH + 2,
        )
      ),
    ]
  end
end
