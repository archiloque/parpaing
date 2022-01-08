class Integer
  # @return [MeasurementNumber]
  def to_m
    MeasurementNumber.new(self)
  end

  # @return [BrickNumber]
  def to_b
    BrickNumber.new(self)
  end
end