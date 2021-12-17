class FruitTree < Part
  def initialize()
    super(
      x: 4,
      y: 6,
      z: 4,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Plant, Fruit Tree',
        part_code: '3470',
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x * BRICK_WIDTH) + 10,
        y: (y * BRICK_HEIGHT) - 12,
        z: (z * BRICK_WIDTH) + 10,
      ),
    ]
  end
end

class PineTree < Part
  def initialize()
    super(
      x: 4,
      y: 7,
      z: 4,
    )
  end

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part_name: 'Plant, Pine Tree, Large, 4 x 4 x 6 2/3',
        part_code: '3471',
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: (x * BRICK_WIDTH) + 10,
        y: (y * BRICK_HEIGHT) - 12,
        z: (z * BRICK_WIDTH) + 10,
      ),
    ]
  end
end