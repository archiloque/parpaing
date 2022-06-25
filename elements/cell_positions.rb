module CellPositions
  # @param [Delta] delta
  # @return [Boolean]
  def filled?(delta)
    level.world.filled?(
      x: x + delta.x,
      y: y + delta.y,
      z: level.z + delta.z,
    )
  end

  # @return [Boolean]
  def plus_x_filled?
    filled?(Delta::DELTA_PLUS_X)
  end

  # @return [Boolean]
  def minus_x_filled?
    filled?(Delta::DELTA_MINUS_X)
  end

  # @return [Boolean]
  def plus_y_filled?
    filled?(Delta::DELTA_PLUS_Y)
  end

  # @return [Boolean]
  def minus_y_filled?
    filled?(Delta::DELTA_MINUS_Y)
  end

  # @return [Boolean]
  def minus_x_plus_y_filled?
    filled?(Delta::DELTA_MINUS_X + Delta::DELTA_PLUS_Y)
  end

  # @return [Boolean]
  def minus_x_minus_y_filled?
    filled?(Delta::DELTA_MINUS_X + Delta::DELTA_MINUS_Y)
  end

  # @return [Boolean]
  def plus_x_plus_y_filled?
    filled?(Delta::DELTA_PLUS_X + Delta::DELTA_PLUS_Y)
  end

  # @return [Boolean]
  def plus_x_minus_y_filled?
    filled?(Delta::DELTA_PLUS_X + Delta::DELTA_MINUS_Y)
  end

  def plus_z_filled?
    filled?(Delta::DELTA_PLUS_Z)
  end

  def minus_z_filled?
    filled?(Delta::DELTA_MINUS_Z)
  end
end
