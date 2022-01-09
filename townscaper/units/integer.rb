class Integer
  # @return [DrawUnit]
  def to_u
    DrawUnit.new(self)
  end

  # @return [NumberOfBrick]
  def to_b
    NumberOfBrick.new(self)
  end

  # @return [DrawUnitPerBrick]
  def to_d
    DrawUnitPerBrick.new(self)
  end
end
