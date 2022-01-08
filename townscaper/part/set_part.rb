class SetPart
  # @param [Color] color
  # @param [MeasurementNumber] x
  # @param [MeasurementNumber] y
  # @param [MeasurementNumber] z
  # @return [Array<String>]
  def create(color:, x:, y:, z:)
    raise NotImplementedError
  end
end
