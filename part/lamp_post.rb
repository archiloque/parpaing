class LampPost < Part
  def initialize()
    super(
      x: 2,
      y: 8,
      z: 2,
    )
  end

  def create(color:, x:, y:, z:)
    x_position = (x * BRICK_WIDTH) + 10
    z_position = (z * BRICK_WIDTH) + 10
    [
      Emitter.emit(
        part_name: 'Lamp Post 2 x 2 x 7 with 4 Base Flutes',
        part_code: '11062',
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: x_position,
        y: (y * BRICK_HEIGHT) - 172,
        z: z_position,
      ),
      Emitter.emit(
        part_name: 'Minifig Head Plain',
        part_code: '3626b',
        color: Color::TRANS_YELLOW,
        orientation: PartOrientation::DEFAULT,
        x: x_position,
        y: (y * BRICK_HEIGHT) - 196,
        z: z_position,
      ),
      Emitter.emit(
        part_name: 'Dish 2 x 2 Inverted',
        part_code: '4740',
        color: color,
        orientation: PartOrientation::DEFAULT,
        x: x_position,
        y: (y * BRICK_HEIGHT) - 204,
        z: z_position,
      ),
    ]
  end
end
