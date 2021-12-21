class TrashCan < Part
  def initialize()
    super(
      x: 2,
      y: 3,
      z: 2,
      )
  end

  def create(color:, x:, y:, z:)
    x_position = (x * BRICK_WIDTH) - 10
    z_position = (z * BRICK_WIDTH) - 10
    [
      Emitter.emit(
        part_name: 'Trash Can with 4 Cover Holders',
        part_code: '92926',
        color: color,
        orientation: PartOrientation::Z_90,
        x: x_position,
        y: (y * BRICK_HEIGHT) - 52,
        z: z_position,
        ),
      Emitter.emit(
        part_name: 'Dish 2 x 2 Inverted',
        part_code: '4740',
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: x_position,
        y: (y * BRICK_HEIGHT) - 60,
        z: z_position,
        ),
    ]
  end
end
