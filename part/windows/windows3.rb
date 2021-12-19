module Windows3
  def pane_y(y)
    (y - 3) * Part::BRICK_HEIGHT + 20
  end
end

class Windows3Front < Windows2x2Front
  include Windows3
  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **BARS_2x2.merge(
          color: color,
          orientation: PartOrientation::DEFAULT,
          x: (x * BRICK_WIDTH) - 10,
          y: pane_y(y),
          z: (z * BRICK_WIDTH),
          )
      ),
    ]
  end
end

class Windows3Back < Windows2x2Back
  include Windows3
  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **BARS_2x2.merge(
          color: color,
          orientation: PartOrientation::DEFAULT,
          x: (x * BRICK_WIDTH) - 10,
          y: pane_y(y),
          z: (z * BRICK_WIDTH) + 10,
          )
      ),
    ]
  end
end

class Windows3Left < Windows2x2Left
  include Windows3
  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
      Emitter.emit(
        **BARS_2x2.merge(
          color: color,
          orientation: PartOrientation::Z_90,
          x: ((x - 1) * BRICK_WIDTH) - 10,
          y: pane_y(y),
          z: (z * BRICK_WIDTH) + 10,
          )
      ),
    ]
  end
end

class Windows3Right < Windows2x2Right
  include Windows3
  def create(color:, x:, y:, z:)
    [
      create_frame(color: color, x: x, y: y, z: z),
    ]
  end
end