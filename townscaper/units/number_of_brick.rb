class NumberOfBrick
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

  # @param [NumberOfBrick] limit
  # @yieldparam [BrickNumber]
  # @return [void]
  def upto(limit)
    number.upto(limit.number) do |i|
      yield(i.to_b)
    end
  end

  # @param [NumberOfBrick] limit
  # @yieldparam [BrickNumber]
  # @return [void]
  def downto(limit)
    number.downto(limit.number) do |i|
      yield(i.to_b)
    end
  end

  # @param [NumberOfBrick] value
  # @return [NumberOfBrick]
  def +(value)
    check_type(value, NumberOfBrick)
    (number + value.number).to_b
  end

  # @param [NumberOfBrick] value
  # @return [NumberOfBrick]
  def -(value)
    check_type(value, NumberOfBrick)
    (number - value.number).to_b
  end

  # @param [NumberOfBrick] value
  # @return [Boolean]
  def >=(value)
    check_type(value, NumberOfBrick)
    number >= value.number
  end

  # @param [NumberOfBrick] value
  # @return [Boolean]
  def <(value)
    check_type(value, NumberOfBrick)
    number < value.number
  end

  # @return [NumberOfBrick]
  def -@
    (-number).to_b
  end

  # @param [Integer] other
  # @return [Integer]
  def %(other)
    number % other
  end

  # @param [BrickMeasure] size
  # @return [DrawUnit]
  def *(size)
    check_type(size, DrawUnitPerBrick)
    (number * size.number).to_u
  end
end
