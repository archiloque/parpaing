module CellWalls

  def create_walls
    m_y = @y_origin - PLATE_HEIGHT

    0.to_b.downto(-(Cell::HEIGHT_IN_BRICKS - 1.to_b)) do |row_in_brick|
      common = {
        m_y: m_y,
        b_y: row_in_brick,
      }
      create_walls_north(row_in_brick, common)
      create_walls_south(row_in_brick, common)
      create_walls_east(row_in_brick, common)
      create_walls_west(row_in_brick, common)
    end
  end

  private

  def create_walls_north(row_in_brick, common)
    if north_filled?
    else
      if west_filled? && (!north_west_filled?)
      else
        number_of_cells_to_wall = number_of_cells(Delta::DELTA_EAST, Delta::DELTA_NORTH)
        if row_in_brick % 2 == 0
          create_wall_along_x(
            **common.merge(
              b_from_x: @x_origin - (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall),
              b_to_x: @x_origin + Cell::WIDTH_IN_BRICKS,
              b_z: @z_origin,
            )
          )
        else
          create_wall_along_x(
            **common.merge(
              b_from_x: @x_origin + 1.to_b - (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall),
              b_to_x: @x_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
              b_z: @z_origin,
            )
          )
        end
      end
    end
  end

  def create_walls_south(row_in_brick, common)
    if south_filled?
    else
      if west_filled? && (!south_west_filled?)
      else
        number_of_cells_to_wall = number_of_cells(Delta::DELTA_EAST, Delta::DELTA_SOUTH)
        if row_in_brick % 2 == 0
          create_wall_along_x(
            **common.merge(
              b_from_x: @x_origin - (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall),
              b_to_x: @x_origin + Cell::WIDTH_IN_BRICKS,
              b_z: @z_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
            )
          )
        else
          create_wall_along_x(
            **common.merge(
              b_from_x: @x_origin + 1.to_b - (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall),
              b_to_x: @x_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
              b_z: @z_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
            )
          )
        end
      end
    end
  end

  def create_walls_east(row_in_brick, common)
    if east_filled?
    else
      if north_filled? && (!north_east_filled?)
      else
        number_of_cells_to_wall = number_of_cells(Delta::DELTA_SOUTH, Delta::DELTA_EAST)
        if row_in_brick % 2 == 0
          create_wall_along_z(
            **common.merge(
              b_x: @x_origin,
              b_from_z: @z_origin + 1.to_b,
              b_to_z: @z_origin + Cell::WIDTH_IN_BRICKS - 1.to_b + (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall),
              )
          )
        else
          create_wall_along_z(
            **common.merge(
              b_x: @x_origin,
              b_from_z: @z_origin,
              b_to_z: @z_origin + Cell::WIDTH_IN_BRICKS + (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall),
              )
          )
        end
      end
    end
  end

  def create_walls_west(row_in_brick, common)
    if west_filled?
    else
      if north_filled? && (!north_west_filled?)
      else
        number_of_cells_to_wall = number_of_cells(Delta::DELTA_SOUTH, Delta::DELTA_WEST)
        if row_in_brick % 2 == 0
          create_wall_along_z(
            **common.merge(
              b_x: @x_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
              b_from_z: @z_origin + 1.to_b,
              b_to_z: @z_origin + Cell::WIDTH_IN_BRICKS - 1.to_b + (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall),
            )
          )
        else
          create_wall_along_z(
            **common.merge(
              b_x: @x_origin + Cell::WIDTH_IN_BRICKS - 1.to_b,
              b_from_z: @z_origin,
              b_to_z: @z_origin + Cell::WIDTH_IN_BRICKS + (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall),
            )
          )
        end
      end
    end
  end

  # @return [Integer]
  # @param [Delta] direction_to_move
  # @param [Delta] direction_to_check
  def number_of_cells(direction_to_move, direction_to_check)
    length = 0
    delta = direction_to_move
    while filled?(delta) && ! filled?(delta +  direction_to_check)
      length += 1
      delta += direction_to_move
    end
    length
  end
end
