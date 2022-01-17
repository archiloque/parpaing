module CellPositions
  # @param [Delta] delta
  # @return [Boolean]
  def filled?(delta)
    @level.filled?(
      @x_index + delta.x,
      @z_index + delta.z)
  end

  # @return [Boolean]
  def north_filled?
    filled?(Delta::DELTA_NORTH)
  end

  # @return [Boolean]
  def south_filled?
    filled?(Delta::DELTA_SOUTH)
  end

  # @return [Boolean]
  def west_filled?
    filled?(Delta::DELTA_WEST)
  end

  # @return [Boolean]
  def east_filled?
    filled?(Delta::DELTA_EAST)
  end

  # @return [Boolean]
  def south_west_filled?
    filled?(Delta::DELTA_SOUTH  + Delta::DELTA_WEST)
  end

  # @return [Boolean]
  def south_east_filled?
    filled?(Delta::DELTA_SOUTH  + Delta::DELTA_EAST)
  end

  # @return [Boolean]
  def north_west_filled?
    filled?(Delta::DELTA_NORTH  + Delta::DELTA_WEST)
  end

  # @return [Boolean]
  def north_east_filled?
    filled?(Delta::DELTA_NORTH  + Delta::DELTA_EAST)
  end
end
