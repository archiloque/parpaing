module CellPositions
  class Delta
    # @return [Integer]
    attr_reader :x

    # @return [Integer]
    attr_reader :z

    # @param [Integer] x
    # @param [Integer] z
    def initialize(x, z)
      @x = x
      @z = z
    end

    def +(delta)
      Delta.new(
      @x + delta.x,
      @z + delta.z,
      )
    end
  end

  DELTA_NORTH = Delta.new(0, -1)
  DELTA_SOUTH = Delta.new(0, 1)
  DELTA_EAST = Delta.new(1, 0)
  DELTA_WEST = Delta.new(-1, 0)

  # @param [Delta] delta
  # @return [Boolean]
  def filled?(delta)
    @level.filled?(
      @x_index + delta.x,
      @z_index + delta.z)
  end

  # @return [Boolean]
  def north_filled?
    filled?(DELTA_NORTH)
  end

  # @return [Boolean]
  def south_filled?
    filled?(DELTA_SOUTH)
  end

  # @return [Boolean]
  def west_filled?
    filled?(DELTA_WEST)
  end

  # @return [Boolean]
  def east_filled?
    filled?(DELTA_EAST)
  end

  # @return [Boolean]
  def south_west_filled?
    filled?(DELTA_SOUTH  + DELTA_WEST)
  end

  # @return [Boolean]
  def south_east_filled?
    filled?(DELTA_SOUTH  + DELTA_EAST)
  end

  # @return [Boolean]
  def north_west_filled?
    filled?(DELTA_NORTH  + DELTA_WEST)
  end

  # @return [Boolean]
  def north_east_filled?
    filled?(DELTA_NORTH  + DELTA_EAST)
  end

  # @return [Integer]
  def cells_filled_east
    cells_filled_direction(DELTA_EAST)
  end

  # @return [Integer]
  def cells_filled_south
    cells_filled_direction(DELTA_SOUTH)
  end

  # @param [CellPositions::Delta] delta
  # @return [Integer]
  def cells_filled_direction(delta)
    number_of_cells_to_wall = 0
    current_delta = delta
    while filled?(current_delta)
      number_of_cells_to_wall += 1
      current_delta += delta
    end
    number_of_cells_to_wall
  end
end