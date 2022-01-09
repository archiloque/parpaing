# Wrapper
class BrickNumber
  # @return [Integer]
  attr_reader :number

  # @param [Integer] number
  def initialize(number)
    @number = number
  end

  # @param [BrickNumber] limit
  # @yieldparam [BrickNumber]
  # @return [void]
  def upto(limit)
    number.upto(limit.number) do |i|
      yield(i.to_b)
    end
  end

  # @param [BrickNumber] limit
  # @yieldparam [BrickNumber]
  # @return [void]
  def downto(limit)
    number.downto(limit.number) do |i|
      yield(i.to_b)
    end
  end

  # @param [BrickNumber] value
  # @return [BrickNumber]
  def +(value)
    check_brick_number(value)
    (number + value.number).to_b
  end

  # @param [BrickNumber] value
  # @return [BrickNumber]
  def -(value)
    check_brick_number(value)
    (number - value.number).to_b
  end

  # @param [BrickNumber] value
  # @return [Boolean]
  def >=(value)
    check_brick_number(value)
    number >= value.number
  end

  # @param [BrickNumber] value
  # @return [Boolean]
  def <(value)
    check_brick_number(value)
    number < value.number
  end

  # @return [BrickNumber]
  def -@
    (-number).to_b
  end

  # @param [Integer] other
  # @return [Integer]
  def %(other)
    number % other
  end

  # @return [String]
  def to_s
    "B #{number}"
  end

  private

  # @param [Object] value
  # @return [void]
  def check_brick_number(value)
    unless value.is_a?(BrickNumber)
      raise "#{value} is not a BrickNumber"
    end
  end

end