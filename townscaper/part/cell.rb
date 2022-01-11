class Cell
  include Occupier
  include WithResult
  include WithWalls

  WIDTH_IN_BRICKS = 12.to_b
  HEIGHT_IN_BRICKS = 6.to_b

  WIDTH_IN_UNIT = WIDTH_IN_BRICKS * Measures::BRICK_WIDTH
  HEIGHT_IN_UNIT = (HEIGHT_IN_BRICKS * Measures::BRICK_HEIGHT) + (Measures::PLATE_HEIGHT * 2)

  # @param [Integer] x_index
  # @param [Integer] z_index
  # @param [DrawUnit] y_origin
  # @param [Level] level
  def initialize(
    x_index:,
    y_origin:,
    z_index:,
    level:
  )
    @x_index = x_index
    @y_origin = y_origin
    @z_index = z_index
    @level = level

    @x_origin = WIDTH_IN_BRICKS * @x_index
    @z_origin = WIDTH_IN_BRICKS * @z_index
  end

  def create
    create_walls
    create_floor
    create_roof
    create_basement
    result
  end

  private

  def create_walls_even(common)
    # North wall
    create_wall_along_x(
      **common.merge(
        b_from_x: @x_origin,
        b_to_x: @x_origin + WIDTH_IN_BRICKS,
        b_z: @z_origin,
      )
    )
    # South wall
    create_wall_along_x(
      **common.merge(
        b_from_x: @x_origin,
        b_to_x: @x_origin + WIDTH_IN_BRICKS,
        b_z: @z_origin + WIDTH_IN_BRICKS - 1.to_b,
      )
    )
    # East
    create_wall_along_z(
      **common.merge(
        b_x: @x_origin,
        b_from_z: @z_origin + 1.to_b,
        b_to_z: @z_origin + WIDTH_IN_BRICKS - 1.to_b,
      )
    )
    # West
    create_wall_along_z(
      **common.merge(
        b_x: @x_origin + WIDTH_IN_BRICKS - 1.to_b,
        b_from_z: @z_origin + 1.to_b,
        b_to_z: @z_origin + WIDTH_IN_BRICKS - 1.to_b,
      )
    )
  end

  def create_walls_odd(common)
    # North wall
    create_wall_along_x(
      **common.merge(
        b_from_x: @x_origin + 1.to_b,
        b_to_x: @x_origin + WIDTH_IN_BRICKS - 1.to_b,
        b_z: @z_origin,
      )
    )
    # South wall
    create_wall_along_x(
      **common.merge(
        b_from_x: @x_origin + 1.to_b,
        b_to_x: @x_origin + WIDTH_IN_BRICKS - 1.to_b,
        b_z: @z_origin + WIDTH_IN_BRICKS - 1.to_b,
      )
    )
    # East
    create_wall_along_z(
      **common.merge(
        b_x: @x_origin,
        b_from_z: @z_origin,
        b_to_z: @z_origin + WIDTH_IN_BRICKS,
      )
    )
    # West
    create_wall_along_z(
      **common.merge(
        b_x: @x_origin + WIDTH_IN_BRICKS - 1.to_b,
        b_from_z: @z_origin,
        b_to_z: @z_origin + WIDTH_IN_BRICKS,
      )
    )
  end

  def create_floor
    elements = SetPart.calculate_fit(WIDTH_IN_BRICKS, Plate::BY_SIZE)
    current_x = 0.to_b
    elements.each do |element|
      part = element.part_class.new
      add_part(
        m_y: @y_origin,
        b_x: @x_origin + current_x,
        b_y: 0.to_b,
        b_z: @z_origin,
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
        m_y: @y_origin - PLATE_HEIGHT - (HEIGHT_IN_BRICKS * BRICK_HEIGHT),
        b_x: @x_origin + current_x,
        b_y: 0.to_b,
        b_z: @z_origin,
        part: part,
        color: Color::YELLOW
      )
      current_x += element.size
    end
  end

  def create_walls
    m_y = @y_origin - PLATE_HEIGHT

    0.to_b.downto(-(HEIGHT_IN_BRICKS - 1.to_b)) do |row_in_brick|
      common = {
        m_y: m_y,
        b_y: row_in_brick,
      }

      if row_in_brick % 2 == 0
        create_walls_even(common)
      else
        create_walls_odd(common)
      end
    end
  end

  def create_basement
    common = {
      m_y: @y_origin + (1.to_b * Measures::BRICK_HEIGHT),
      color: Color::YELLOW
    }
    create_basement_north(common)
    create_basement_south(common)
    create_basement_east(common)
    create_basement_west(common)
  end

  def create_basement_north(common)
    if @level.filled?(@x_index, @z_index - 1)
      # Between two cells
    else
      add_part(
        **common.merge(
          b_x: @x_origin + 3.to_b,
          b_y: 0.to_b,
          b_z: @z_origin,
          part: ArchX.new,
        )
      )

      unless @level.filled?(@x_index - 1, @z_index)
        # Standard case
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 0.to_b,
            b_z: @z_origin,
            part: Brick1X3X.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 1.to_b,
            b_y: 1.to_b,
            b_z: @z_origin,
            part: Brick1X3X.new,
          )
        )
      end

      if @level.filled?(@x_index + 1, @z_index)
        # Another cell on the same side
        add_part(
          **common.merge(
            b_x: @x_origin + 9.to_b,
            b_y: 0.to_b,
            b_z: @z_origin,
            part: ArchX.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 8.to_b,
            b_y: 1.to_b,
            b_z: @z_origin,
            part: Brick1X2X.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 14.to_b,
            b_y: 1.to_b,
            b_z: @z_origin,
            part: Brick1X2X.new,
          )
        )
      else
        # Standard case
        add_part(
          **common.merge(
            b_x: @x_origin + 9.to_b,
            b_y: 0.to_b,
            b_z: @z_origin,
            part: Brick1X3X.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 8.to_b,
            b_y: 1.to_b,
            b_z: @z_origin,
            part: Brick1X3X.new,
          )
        )
      end
    end
  end

  def create_basement_south(common)
    if @level.filled?(@x_index, @z_index + 1)
      # Between two cells
    else
      add_part(
        **common.merge(
          b_x: @x_origin + 3.to_b,
          b_y: 0.to_b,
          b_z: @z_origin + 11.to_b,
          part: ArchX.new,
        )
      )

      unless @level.filled?(@x_index - 1, @z_index)
        # Standard case
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 0.to_b,
            b_z: @z_origin + 11.to_b,
            part: Brick1X3X.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 1.to_b,
            b_y: 1.to_b,
            b_z: @z_origin + 11.to_b,
            part: Brick1X3X.new,
          )
        )
      end

      if @level.filled?(@x_index + 1, @z_index)
        # Another cell on the same side
        add_part(
          **common.merge(
            b_x: @x_origin + 9.to_b,
            b_y: 0.to_b,
            b_z: @z_origin + 11.to_b,
            part: ArchX.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 8.to_b,
            b_y: 1.to_b,
            b_z: @z_origin + 11.to_b,
            part: Brick1X2X.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 14.to_b,
            b_y: 1.to_b,
            b_z: @z_origin + 11.to_b,
            part: Brick1X2X.new,
          )
        )
      else
        add_part(
          **common.merge(
            b_x: @x_origin + 9.to_b,
            b_y: 0.to_b,
            b_z: @z_origin + 11.to_b,
            part: Brick1X3X.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 8.to_b,
            b_y: 1.to_b,
            b_z: @z_origin + 11.to_b,
            part: Brick1X3X.new,
          )
        )
      end
    end
  end

  def create_basement_east(common)
    if @level.filled?(@x_index - 1, @z_index)
      # Between two cells
    else
      add_part(
        **common.merge(
          b_x: @x_origin,
          b_y: 0.to_b,
          b_z: @z_origin + 3.to_b,
          part: ArchZ.new,
        )
      )

      unless @level.filled?(@x_index, @z_index - 1)
        # Standard case
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 0.to_b,
            b_z: @z_origin + 1.to_b,
            part: Brick1X2Z.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 1.to_b,
            b_z: @z_origin,
            part: Brick1X4Z.new,
          )
        )
      end

      if @level.filled?(@x_index, @z_index + 1)
        # Another cell on the same side
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 0.to_b,
            b_z: @z_origin + 9.to_b,
            part: ArchZ.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 1.to_b,
            b_z: @z_origin + 8.to_b,
            part: Brick1X2Z.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 1.to_b,
            b_z: @z_origin + 14.to_b,
            part: Brick1X2Z.new,
          )
        )
      else
        # Standard case
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 0.to_b,
            b_z: @z_origin + 9.to_b,
            part: Brick1X2Z.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 1.to_b,
            b_z: @z_origin + 8.to_b,
            part: Brick1X4Z.new,
          )
        )
      end
    end
  end

  def create_basement_west(common)
    if @level.filled?(@x_index + 1, @z_index)
      # Between two cells
    else
      add_part(
        **common.merge(
          b_x: @x_origin + 11.to_b,
          b_y: 0.to_b,
          b_z: @z_origin + 3.to_b,
          part: ArchZ.new,
        )
      )

      unless @level.filled?(@x_index, @z_index - 1)
        # Standard case
        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 0.to_b,
            b_z: @z_origin + 1.to_b,
            part: Brick1X2Z.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 1.to_b,
            b_z: @z_origin,
            part: Brick1X4Z.new,
          )
        )
      end

      if @level.filled?(@x_index, @z_index + 1)
        # Another cell on the same side
        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 0.to_b,
            b_z: @z_origin + 9.to_b,
            part: ArchZ.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 1.to_b,
            b_z: @z_origin + 8.to_b,
            part: Brick1X2Z.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 1.to_b,
            b_z: @z_origin + 14.to_b,
            part: Brick1X2Z.new,
          )
        )
      else
        # Standard case
        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 0.to_b,
            b_z: @z_origin + 9.to_b,
            part: Brick1X2Z.new,
          )
        )

        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 1.to_b,
            b_z: @z_origin + 8.to_b,
            part: Brick1X4Z.new,
          )
        )
      end
    end
  end
end
