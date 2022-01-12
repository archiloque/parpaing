module CellPositions
  # @return [Boolean]
  def north_filled?
    @level.filled?(@x_index, @z_index - 1)
  end

  # @return [Boolean]
  def south_filled?
    @level.filled?(@x_index, @z_index + 1)
  end

  # @return [Boolean]
  def east_filled?
    @level.filled?(@x_index + 1, @z_index)
  end

  # @return [Boolean]
  def west_filled?
    @level.filled?(@x_index - 1, @z_index)
  end

  # @return [Boolean]
  def south_east_filled?
    @level.filled?(@x_index + 1, @z_index + 1)
  end

  # @return [Boolean]
  def south_west_filled?
    @level.filled?(@x_index - 1, @z_index + 1)
  end

  # @return [Boolean]
  def north_east_filled?
    @level.filled?(@x_index + 1, @z_index - 1)
  end

  # @return [Boolean]
  def north_west_filled?
    @level.filled?(@x_index - 1, @z_index - 1)
  end
end