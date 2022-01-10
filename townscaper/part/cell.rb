class Cell
  include Occupier
  include WithResult
  include WithWalls

  WIDTH_IN_BRICKS = 12.to_b
  HEIGHT_IN_BRICKS = 6.to_b

  WIDTH_IN_UNIT = WIDTH_IN_BRICKS * Measures::BRICK_WIDTH
  HEIGHT_IN_UNIT = (HEIGHT_IN_BRICKS * Measures::BRICK_HEIGHT) + (Measures::PLATE_HEIGHT * 2)

  # @param [DrawUnit] x_origin
  # @param [DrawUnit] y_origin
  # @param [DrawUnit] z_origin
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
    create_basement
    result
  end

  private

  def create_floor
    elements = SetPart.calculate_fit(WIDTH_IN_BRICKS, Plate::BY_SIZE)
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
        color: Color::YELLOW
      )
      current_x += element.size
    end
  end

  def create_roof
    elements = SetPart.calculate_fit(WIDTH_IN_BRICKS, Plate::BY_SIZE)
    current_x = 0.to_b
    elements.each do |element|
      part = element.part_class.new
      add_part(
        m_x: @x_origin,
        m_y: @y_origin - PLATE_HEIGHT - (HEIGHT_IN_BRICKS * BRICK_HEIGHT),
        m_z: @z_origin,
        b_x: current_x,
        b_y: 0.to_b,
        b_z: 0.to_b,
        part: part,
        color: Color::YELLOW
      )
      current_x += element.size
    end
  end

  def create_walls
    m_x = @x_origin
    m_y = @y_origin - PLATE_HEIGHT
    m_z = @z_origin

    0.to_b.downto(-(HEIGHT_IN_BRICKS - 1.to_b)) do |row_in_brick|
      common = {
        m_x: m_x,
        m_y: m_y,
        m_z: m_z,
        b_y: row_in_brick,
      }

      if row_in_brick % 2 == 0
        # North wall
        create_wall_along_x(
          **common.merge(
            b_from_x: 0.to_b,
            b_to_x: WIDTH_IN_BRICKS,
            b_z: 0.to_b,
          )
        )
        # South wall
        create_wall_along_x(
          **common.merge(
            b_from_x: 0.to_b,
            b_to_x: WIDTH_IN_BRICKS,
            b_z: WIDTH_IN_BRICKS - 1.to_b,
          )
        )
        # East
        create_wall_along_z(
          **common.merge(
            b_x: 0.to_b,
            b_from_z: 1.to_b,
            b_to_z: WIDTH_IN_BRICKS - 1.to_b,
          )
        )
        # West
        create_wall_along_z(
          **common.merge(
            b_x: WIDTH_IN_BRICKS - 1.to_b,
            b_from_z: 1.to_b,
            b_to_z: WIDTH_IN_BRICKS - 1.to_b,
          )
        )
      else
        # North wall
        create_wall_along_x(
          **common.merge(
            b_from_x: 1.to_b,
            b_to_x: WIDTH_IN_BRICKS - 1.to_b,
            b_z: 0.to_b,
          )
        )
        # South wall
        create_wall_along_x(
          **common.merge(
            b_from_x: 1.to_b,
            b_to_x: WIDTH_IN_BRICKS - 1.to_b,
            b_z: WIDTH_IN_BRICKS - 1.to_b,
          )
        )
        # East
        create_wall_along_z(
          **common.merge(
            b_x: 0.to_b,
            b_from_z: 0.to_b,
            b_to_z: WIDTH_IN_BRICKS,
          )
        )
        # West
        create_wall_along_z(
          **common.merge(
            b_x: WIDTH_IN_BRICKS - 1.to_b,
            b_from_z: 0.to_b,
            b_to_z: WIDTH_IN_BRICKS,
          )
        )
      end
    end
  end

  def create_basement
    common = {
      m_x: @x_origin,
      m_y: @y_origin + (1.to_b * Measures::BRICK_HEIGHT),
      m_z: @z_origin,
      color: Color::YELLOW
    }

    # First level
    add_part(
      **common.merge(
        b_x: 0.to_b,
        b_y: 0.to_b,
        b_z: 0.to_b,
        part: Brick1X3X.new,
      )
    )
    add_part(
      **common.merge(
        b_x: 3.to_b,
        b_y: 0.to_b,
        b_z: 0.to_b,
        part: ArchX.new,
      )
    )
    add_part(
      **common.merge(
        b_x: 9.to_b,
        b_y: 0.to_b,
        b_z: 0.to_b,
        part: Brick1X3X.new,
      )
    )

    add_part(
      **common.merge(
        b_x: 0.to_b,
        b_y: 0.to_b,
        b_z: 11.to_b,
        part: Brick1X3X.new,
      )
    )
    add_part(
      **common.merge(
        b_x: 3.to_b,
        b_y: 0.to_b,
        b_z: 11.to_b,
        part: ArchX.new,
      )
    )
    add_part(
      **common.merge(
        b_x: 9.to_b,
        b_y: 0.to_b,
        b_z: 11.to_b,
        part: Brick1X3X.new,
      )
    )

    add_part(
      **common.merge(
        b_x: 0.to_b,
        b_y: 0.to_b,
        b_z: 1.to_b,
        part: Brick1X2Z.new,
      )
    )
    add_part(
      **common.merge(
        b_x: 0.to_b,
        b_y: 0.to_b,
        b_z: 3.to_b,
        part: ArchZ.new,
      )
    )
    add_part(
      **common.merge(
        b_x: 0.to_b,
        b_y: 0.to_b,
        b_z: 9.to_b,
        part: Brick1X2Z.new,
      )
    )

    add_part(
      **common.merge(
        b_x: 11.to_b,
        b_y: 0.to_b,
        b_z: 1.to_b,
        part: Brick1X2Z.new,
      )
    )
    add_part(
      **common.merge(
        b_x: 11.to_b,
        b_y: 0.to_b,
        b_z: 3.to_b,
        part: ArchZ.new,
      )
    )
    add_part(
      **common.merge(
        b_x: 11.to_b,
        b_y: 0.to_b,
        b_z: 9.to_b,
        part: Brick1X2Z.new,
      )
    )

    # Second level
    add_part(
      **common.merge(
        b_x: 1.to_b,
        b_y: 1.to_b,
        b_z: 0.to_b,
        part: Brick1X3X.new,
        )
    )
    add_part(
      **common.merge(
        b_x: 8.to_b,
        b_y: 1.to_b,
        b_z: 0.to_b,
        part: Brick1X3X.new,
        )
    )

    add_part(
      **common.merge(
        b_x: 1.to_b,
        b_y: 1.to_b,
        b_z: 11.to_b,
        part: Brick1X3X.new,
        )
    )
    add_part(
      **common.merge(
        b_x: 8.to_b,
        b_y: 1.to_b,
        b_z: 11.to_b,
        part: Brick1X3X.new,
        )
    )

    add_part(
      **common.merge(
        b_x: 0.to_b,
        b_y: 1.to_b,
        b_z: 0.to_b,
        part: Brick1X4Z.new,
        )
    )
    add_part(
      **common.merge(
        b_x: 0.to_b,
        b_y: 1.to_b,
        b_z: 8.to_b,
        part: Brick1X4Z.new,
        )
    )

    add_part(
      **common.merge(
        b_x: 11.to_b,
        b_y: 1.to_b,
        b_z: 0.to_b,
        part: Brick1X4Z.new,
        )
    )
    add_part(
      **common.merge(
        b_x: 11.to_b,
        b_y: 1.to_b,
        b_z: 8.to_b,
        part: Brick1X4Z.new,
        )
    )

    add_part(
      m_x: @x_origin,
      m_y: @y_origin + (2.to_b * Measures::BRICK_HEIGHT) - Measures::STUD_HEIGHT,
      m_z: @z_origin,
      color: Color::BLUE,
      b_x: - ((Measures::BASEPLATE_WIDTH - WIDTH_IN_BRICKS) / 2),
      b_y: 0.to_b,
      b_z: - ((Measures::BASEPLATE_WIDTH - WIDTH_IN_BRICKS) / 2),
      part: BasePlate.new,
    )
  end

end
