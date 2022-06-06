module CellWalls

  def create_walls
    north_wall = (!north_filled?) && (!(west_filled? && (!north_west_filled?)))
    south_wall = (!south_filled?) && (!(west_filled? && (!south_west_filled?)))
    west_wall = (!west_filled?) && (!(north_filled? && (!north_west_filled?)))
    east_wall = (!east_filled?) && (!(north_filled? && (!north_east_filled?)))

    wall_in_north = wall_in_direction(Delta::DELTA_EAST, Delta::DELTA_NORTH)
    wall_in_south = wall_in_direction(Delta::DELTA_EAST, Delta::DELTA_SOUTH)
    wall_in_west = wall_in_direction(Delta::DELTA_SOUTH, Delta::DELTA_WEST)
    wall_in_east = wall_in_direction(Delta::DELTA_SOUTH, Delta::DELTA_EAST)

    with(
      m_y: -PLATE_HEIGHT,
    ) do
      with(
        color: Color::BRIGHT_GREEN,
        b_y: -2.to_b,
      ) do

        if north_wall
          0.upto(wall_in_north.length) do |index|
            add_part(
              b_x: 4.to_b - (Cell::WIDTH_IN_BRICKS * index),
              b_z: 0.to_b,
              part: WindowsNorth.new,
            )
          end
        end
        if south_wall
          0.upto(wall_in_south.length) do |index|
            add_part(
              b_x: 4.to_b - (Cell::WIDTH_IN_BRICKS * index),
              b_z: 11.to_b,
              part: WindowsSouth.new,
            )
          end
        end
        if west_wall
          0.upto(wall_in_west.length) do |index|
            add_part(
              b_x: 11.to_b,
              b_z: 4.to_b + (Cell::WIDTH_IN_BRICKS * index),
              part: WindowsWest.new,
            )
          end
        end
        if east_wall
          0.upto(wall_in_east.length) do |index|
            add_part(
              b_x: 0.to_b,
              b_z: 4.to_b + (Cell::WIDTH_IN_BRICKS * index),
              part: WindowsEast.new,
            )
          end
        end
      end

      0.to_b.downto(-(Cell::HEIGHT_IN_BRICKS - 1.to_b)) do |row_in_brick|
        with(
          b_y: row_in_brick,
          color: Color::YELLOW,
        ) do
          if north_wall
            create_walls_north(row_in_brick, wall_in_north)
          end
          if south_wall
            create_walls_south(row_in_brick, wall_in_south)
          end
          if west_wall
            create_walls_west(row_in_brick, wall_in_west)
          end
          if east_wall
            create_walls_east(row_in_brick, wall_in_east)
          end
        end
      end
    end
  end

  private

  # @param [NumberOfBrick] row_in_brick
  # @param [Cell::WallInDirectionResult] current_wall_in_direction
  # @return [void]
  def create_walls_north(row_in_brick, current_wall_in_direction)
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

  # @param [NumberOfBrick] row_in_brick
  # @param [Cell::WallInDirectionResult] current_wall_in_direction
  # @return [void]
  def create_walls_south(row_in_brick, current_wall_in_direction)
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

  # @param [NumberOfBrick] row_in_brick
  # @param [Cell::WallInDirectionResult] current_wall_in_direction
  # @return [void]
  def create_walls_east(row_in_brick, current_wall_in_direction)
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

  # @param [NumberOfBrick] row_in_brick
  # @param [Cell::WallInDirectionResult] current_wall_in_direction
  # @return [void]
  def create_walls_west(row_in_brick, current_wall_in_direction)
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

    def to_s
      "#{self.class} length: #{length}, corner: #{corner}"
    end
  end
end
