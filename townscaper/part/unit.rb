class Unit
  include Measures
  include Occupier
  include WithResult
  include WithWalls

  UNIT_WIDTH_IN_BRICKS = 12.to_b
  UNIT_HEIGHT_IN_BRICKS = 6.to_b

  UNIT_WIDTH_IN_MEASUREMENT = (UNIT_WIDTH_IN_BRICKS.number * BRICK_WIDTH).to_m
  UNIT_HEIGHT_IN_MEASUREMENT = ((UNIT_HEIGHT_IN_BRICKS.number * BRICK_HEIGHT) + (2 * PLATE_HEIGHT)).to_m

  # @param [MeasurementNumber] x_origin
  # @param [MeasurementNumber] y_origin
  # @param [MeasurementNumber] z_origin
  def initialize(
    x_origin:,
    y_origin:,
    z_origin:
  )
    @x_origin = x_origin
    @y_origin = y_origin
    @z_origin = z_origin
  end

  def create
    0.to_b.downto(-UNIT_HEIGHT_IN_BRICKS) do |row_in_brick|
      if row_in_brick % 2 == 0
        # North wall
        create_wall_along_x(
          from_x: 0.to_b,
          to_x: UNIT_WIDTH_IN_BRICKS,
          y: row_in_brick,
          z: 0.to_b,
        )
        # South wall
        create_wall_along_x(
          from_x: 0.to_b,
          to_x: UNIT_WIDTH_IN_BRICKS,
          y: row_in_brick,
          z: UNIT_WIDTH_IN_BRICKS - 1.to_b,
        )
        # East
        create_wall_along_z(
          x: 0.to_b,
          y: row_in_brick,
          from_z: 1.to_b,
          to_z: UNIT_WIDTH_IN_BRICKS - 1.to_b,
        )
        # West
        create_wall_along_z(
          x: UNIT_WIDTH_IN_BRICKS - 1.to_b,
          y: row_in_brick,
          from_z: 1.to_b,
          to_z: UNIT_WIDTH_IN_BRICKS - 1.to_b,
        )
      else
        # North wall
        create_wall_along_x(
          from_x: 1.to_b,
          to_x: UNIT_WIDTH_IN_BRICKS - 1.to_b,
          y: row_in_brick,
          z: 0.to_b,
          )
        # South wall
        create_wall_along_x(
          from_x: 1.to_b,
          to_x: UNIT_WIDTH_IN_BRICKS - 1.to_b,
          y: row_in_brick,
          z: UNIT_WIDTH_IN_BRICKS - 1.to_b,
          )
        # East
        create_wall_along_z(
          x: 0.to_b,
          y: row_in_brick,
          from_z: 0.to_b,
          to_z: UNIT_WIDTH_IN_BRICKS,
          )
        # West
        create_wall_along_z(
          x: UNIT_WIDTH_IN_BRICKS - 1.to_b,
          y: row_in_brick,
          from_z: 0.to_b,
          to_z: UNIT_WIDTH_IN_BRICKS,
          )
      end
    end
    result
  end

end
