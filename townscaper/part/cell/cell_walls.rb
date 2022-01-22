module CellWalls

  def create_walls
    0.to_b.downto(-(Cell::HEIGHT_IN_BRICKS - 1.to_b)) do |row_in_brick|
      with(
        m_y: - PLATE_HEIGHT,
        b_y: row_in_brick,
        color: Color::YELLOW,
      ) do
        create_walls_north(row_in_brick)
        create_walls_south(row_in_brick)
        create_walls_east(row_in_brick)
        create_walls_west(row_in_brick)
      end
    end
  end

  private

  def create_walls_north(row_in_brick)
    if north_filled?
    else
      if west_filled? && (!north_west_filled?)
      else
        current_wall_in_direction = wall_in_direction(Delta::DELTA_EAST, Delta::DELTA_NORTH)
        number_of_cells_to_wall = current_wall_in_direction.length

        added_border_west = (west_filled? && north_west_filled?) ? 1.to_b : 0.to_b
        added_border_east = current_wall_in_direction.corner ? 1.to_b : 0.to_b

        if row_in_brick % 2 == 0
          create_wall_along_x(
            b_from_x: -(Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall) - added_border_east,
            b_to_x: Cell::WIDTH_IN_BRICKS + added_border_west,
            b_z: 0.to_b,
          )
        else
          create_wall_along_x(
            b_from_x: 1.to_b - (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall) - added_border_east,
            b_to_x: Cell::WIDTH_IN_BRICKS - 1.to_b + added_border_west,
            b_z: 0.to_b,
          )
        end
      end
    end
  end

  def create_walls_south(row_in_brick)
    if south_filled?
    else
      if west_filled? && (!south_west_filled?)
      else
        current_wall_in_direction = wall_in_direction(Delta::DELTA_EAST, Delta::DELTA_SOUTH)
        number_of_cells_to_wall = current_wall_in_direction.length

        added_border_west = (west_filled? && south_west_filled?) ? 1.to_b : 0.to_b
        added_border_east = current_wall_in_direction.corner ? 1.to_b : 0.to_b

        if row_in_brick % 2 == 0
          create_wall_along_x(
            b_from_x: -(Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall) - added_border_east,
            b_to_x: Cell::WIDTH_IN_BRICKS + added_border_west,
            b_z: Cell::WIDTH_IN_BRICKS - 1.to_b,
          )
        else
          create_wall_along_x(
            b_from_x: 1.to_b - (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall) - added_border_east,
            b_to_x: Cell::WIDTH_IN_BRICKS - 1.to_b + added_border_west,
            b_z: Cell::WIDTH_IN_BRICKS - 1.to_b,
          )
        end
      end
    end
  end

  def create_walls_east(row_in_brick)
    if east_filled?
    else
      if north_filled? && (!north_east_filled?)
      else
        current_wall_in_direction = wall_in_direction(Delta::DELTA_SOUTH, Delta::DELTA_EAST)
        number_of_cells_to_wall = current_wall_in_direction.length

        added_border_north = (north_filled? && north_east_filled?) ? -1.to_b : 0.to_b
        added_border_south = current_wall_in_direction.corner ? 1.to_b : 0.to_b

        if row_in_brick % 2 == 0
          create_wall_along_z(
            b_x: 0.to_b,
            b_from_z: 1.to_b + added_border_north,
            b_to_z: Cell::WIDTH_IN_BRICKS - 1.to_b + (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall) + added_border_south,
          )
        else
          create_wall_along_z(
            b_x: 0.to_b,
            b_from_z: added_border_north,
            b_to_z: Cell::WIDTH_IN_BRICKS + (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall) + added_border_south,
          )
        end
      end
    end
  end

  def create_walls_west(row_in_brick)
    if west_filled?
    else
      if north_filled? && (!north_west_filled?)
      else
        current_wall_in_direction = wall_in_direction(Delta::DELTA_SOUTH, Delta::DELTA_WEST)
        number_of_cells_to_wall = current_wall_in_direction.length

        added_border_north = (north_filled? && north_west_filled?) ? -1.to_b : 0.to_b
        added_border_south = current_wall_in_direction.corner ? 1.to_b : 0.to_b

        if row_in_brick % 2 == 0
          create_wall_along_z(
            b_x: Cell::WIDTH_IN_BRICKS - 1.to_b,
            b_from_z: 1.to_b + added_border_north,
            b_to_z: Cell::WIDTH_IN_BRICKS - 1.to_b + (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall) + added_border_south,
          )
        else
          create_wall_along_z(
            b_x: Cell::WIDTH_IN_BRICKS - 1.to_b,
            b_from_z: added_border_north,
            b_to_z: Cell::WIDTH_IN_BRICKS + (Cell::WIDTH_IN_BRICKS * number_of_cells_to_wall) + added_border_south,
          )
        end
      end
    end
  end

  # @param [Delta] direction_to_move
  # @param [Delta] direction_to_check
  # @return [WallInDirectionResult]
  def wall_in_direction(direction_to_move, direction_to_check)
    length = 0
    delta = direction_to_move
    while filled?(delta) && !filled?(delta + direction_to_check)
      length += 1
      delta += direction_to_move
    end
    WallInDirectionResult.new(length, filled?(delta) && filled?(delta + direction_to_check))
  end

  class WallInDirectionResult
    # @return [Integer]
    attr_reader :length
    # @return [Boolean]
    attr_reader :corner

    # @param [Integer] length
    # @param [Boolean] corner
    def initialize(length, corner)
      @corner = corner
      @length = length
    end
  end
end
