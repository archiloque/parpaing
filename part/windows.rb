class Windows < Part
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
      Emitter.emit(
        part_name: 'Window 1 x 4 x 3',
        part_code: '3853',
        color: color,
        orientation: Orientation::DEFAULT,
        x: (x + 0.5) * BRICK_WIDTH,
        y: (y - @y) * BRICK_HEIGHT - STUD_HEIGHT,
        z: z * BRICK_WIDTH,
      ),
      Emitter.emit(
        part_name: 'Window 1 x 2 x 3 Pane with Thick Corner Tabs',
        part_code: '60608',
        color: color,
        orientation: Orientation::Z_90,
        x: (x - 1) * BRICK_WIDTH - 2,
        y: pane_y,
        z: pane_z,
      ),
      Emitter.emit(
        part_name: 'Window 1 x 2 x 3 Pane with Thick Corner Tabs',
        part_code: '60608',
        color: color,
        orientation: Orientation::Z_270,
        x: (x + 2) * BRICK_WIDTH + 2,
        y: pane_y,
        z: pane_z,
      ),
    ]
  end
end