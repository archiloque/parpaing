class Fence < Part
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
        part_name: 'Picket Fence 1 x 4 x 2',
        part_code: '33303',
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x + 3.5) * BRICK_WIDTH,
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
        part_name: 'Picket Fence 1 x 4 x 2',
        part_code: '33303',
        color: color,
        orientation: PartOrientation::Z_90,
        x: (x - 1) * BRICK_WIDTH,
        y: create_y(y),
        z: (z - 1.5) * BRICK_WIDTH,
      ),
    ]
  end
end