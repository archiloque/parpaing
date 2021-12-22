class Fence < SetPart
  PICKET_FENCE = Part.new('Picket Fence 1 x 4 x 2', '33303')

  def create_y(y)
    (y * BRICK_HEIGHT) - 52
  end

end

class FenceTowardX < Fence
  def initialize()
    super(
      x: 4,
      y: 2,
      z: 1,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: PICKET_FENCE,
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x * BRICK_WIDTH) + 70,
        y: create_y(y),
        z: z * BRICK_WIDTH,
      ),
    ]
  end
end

class FenceTowardZ < Fence
  def initialize()
    super(
      x: 1,
      y: 2,
      z: 4,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: PICKET_FENCE,
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x * BRICK_WIDTH) - 20,
        y: create_y(y),
        z: (z * BRICK_WIDTH) - 30,
      ),
    ]
  end
end