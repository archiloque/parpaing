module CellWalls

  def create_walls
    m_y = @y_origin - PLATE_HEIGHT

    0.to_b.downto(-(Cell::HEIGHT_IN_BRICKS - 1.to_b)) do |row_in_brick|
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

  private

  def create_walls_even(common)
    # North wall
    create_wall_along_x(
      **common.merge(
        b_from_x: @x_origin,
        b_to_x: @x_origin + Cell::WIDTH_IN_BRICKS,
        b_z: @z_origin,
      )
    )
    # South wall
    create_wall_along_x(
      **common.merge(
        b_from_x: @x_origin,
        b_to_x: @x_origin + Cell::WIDTH_IN_BRICKS,
        b_z: @z_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
      )
    )
    # East
    create_wall_along_z(
      **common.merge(
        b_x: @x_origin,
        b_from_z: @z_origin + 1.to_b,
        b_to_z: @z_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
      )
    )
    # West
    create_wall_along_z(
      **common.merge(
        b_x: @x_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
        b_from_z: @z_origin + 1.to_b,
        b_to_z: @z_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
      )
    )
  end

  def create_walls_odd(common)
    # North wall
    create_wall_along_x(
      **common.merge(
        b_from_x: @x_origin + 1.to_b,
        b_to_x: @x_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
        b_z: @z_origin,
      )
    )
    # South wall
    create_wall_along_x(
      **common.merge(
        b_from_x: @x_origin + 1.to_b,
        b_to_x: @x_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
        b_z: @z_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
      )
    )
    # East
    create_wall_along_z(
      **common.merge(
        b_x: @x_origin,
        b_from_z: @z_origin,
        b_to_z: @z_origin + Cell::WIDTH_IN_BRICKS,
      )
    )
    # West
    create_wall_along_z(
      **common.merge(
        b_x: @x_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
        b_from_z: @z_origin,
        b_to_z: @z_origin + Cell::WIDTH_IN_BRICKS,
      )
    )
  end
end
