class DrawUnit
  include Common

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

  # @param [DrawUnit] value
  # @return [DrawUnit]
  def +(value)
    check_type(value, DrawUnit)
    (number + value.number).to_u
  end

  # @param [DrawUnit] value
  # @return [DrawUnit]
  def -(value)
    check_type(value, DrawUnit)
    (number - value.number).to_u
  end

  # @param [Integer] value
  # @return [DrawUnit]
  def *(value)
    check_type(value, Integer)
    (number * value).to_u
  end
end
