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
    create_walls
    create_floor
    create_roof
    result
  end

  def create_floor
    elements = SetPart.calculate_fit(UNIT_WIDTH_IN_BRICKS, Plate::BY_SIZE)
    current_x = 0.to_b
    elements.each do |element|
      part = element.part_class.new
      add_part(
        m_x: @x_origin,
        m_y: @y_origin,
        m_z: @z_origin,
        b_x: current_x,
        b_y: 0.to_b,
        b_z: 0.to_b,
        part: part,
        color: Color::BLACK
      )
      current_x += element.size
    end
  end

  def create_roof
    elements = SetPart.calculate_fit(UNIT_WIDTH_IN_BRICKS, Plate::BY_SIZE)
    current_x = 0.to_b
    elements.each do |element|
      part = element.part_class.new
      add_part(
        m_x: @x_origin,
        m_y: (@y_origin.number - PLATE_HEIGHT - (UNIT_HEIGHT_IN_BRICKS.number * BRICK_HEIGHT)).to_m,
        m_z: @z_origin,
        b_x: current_x,
        b_y: 0.to_b,
        b_z: 0.to_b,
        part: part,
        color: Color::BLACK
      )
      current_x += element.size
    end
  end

  def create_walls
    m_x = @x_origin
    m_y = @y_origin - PLATE_HEIGHT.to_m
    m_z = @z_origin

    0.to_b.downto(-(UNIT_HEIGHT_IN_BRICKS.number - 1).to_b) do |row_in_brick|
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
  end

end
