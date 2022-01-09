class DrawUnitPerBrick
  # @return [Integer]
  attr_reader :number

  # @param [Integer] number
  def initialize(number)
    @number = number
  end

  # @return [String]
  def to_s
    "#{self.class} #{number}"
  end
end
