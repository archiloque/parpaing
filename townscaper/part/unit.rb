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
    m_x = 0.to_m
    m_y = 0.to_m
    m_z = 0.to_m

    0.to_b.downto(-UNIT_HEIGHT_IN_BRICKS) do |row_in_brick|
      if row_in_brick % 2 == 0
        # North wall
        create_wall_along_x(
          m_x: m_x,
          m_y: m_y,
          m_z: m_z,
          b_from_x: 0.to_b,
          b_to_x: UNIT_WIDTH_IN_BRICKS,
          b_y: row_in_brick,
          b_z: 0.to_b,
        )
        # South wall
        create_wall_along_x(
          m_x: m_x,
          m_y: m_y,
          m_z: m_z,
          b_from_x: 0.to_b,
          b_to_x: UNIT_WIDTH_IN_BRICKS,
          b_y: row_in_brick,
          b_z: UNIT_WIDTH_IN_BRICKS - 1.to_b,
        )
        # East
        create_wall_along_z(
          m_x: m_x,
          m_y: m_y,
          m_z: m_z,
          b_x: 0.to_b,
          b_y: row_in_brick,
          b_from_z: 1.to_b,
          b_to_z: UNIT_WIDTH_IN_BRICKS - 1.to_b,
        )
        # West
        create_wall_along_z(
          m_x: m_x,
          m_y: m_y,
          m_z: m_z,
          b_x: UNIT_WIDTH_IN_BRICKS - 1.to_b,
          b_y: row_in_brick,
          b_from_z: 1.to_b,
          b_to_z: UNIT_WIDTH_IN_BRICKS - 1.to_b,
        )
      else
        # North wall
        create_wall_along_x(
          m_x: m_x,
          m_y: m_y,
          m_z: m_z,
          b_from_x: 1.to_b,
          b_to_x: UNIT_WIDTH_IN_BRICKS - 1.to_b,
          b_y: row_in_brick,
          b_z: 0.to_b,
        )
        # South wall
        create_wall_along_x(
          m_x: m_x,
          m_y: m_y,
          m_z: m_z,
          b_from_x: 1.to_b,
          b_to_x: UNIT_WIDTH_IN_BRICKS - 1.to_b,
          b_y: row_in_brick,
          b_z: UNIT_WIDTH_IN_BRICKS - 1.to_b,
        )
        # East
        create_wall_along_z(
          m_x: m_x,
          m_y: m_y,
          m_z: m_z,
          b_x: 0.to_b,
          b_y: row_in_brick,
          b_from_z: 0.to_b,
          b_to_z: UNIT_WIDTH_IN_BRICKS,
        )
        # West
        create_wall_along_z(
          m_x: m_x,
          m_y: m_y,
          m_z: m_z,
          b_x: UNIT_WIDTH_IN_BRICKS - 1.to_b,
          b_y: row_in_brick,
          b_from_z: 0.to_b,
          b_to_z: UNIT_WIDTH_IN_BRICKS,
        )
      end
    end
    result
  end

end
