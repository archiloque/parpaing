class Integer
  # @return [DrawUnit]
  def to_u
    DrawUnit.new(self)
  end

  # @return [NumberOfBrick]
  def to_b
    NumberOfBrick.new(self)
  end
end
