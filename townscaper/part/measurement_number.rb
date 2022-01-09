# Wrapper
class MeasurementNumber
  # @return [Integer]
  attr_reader :number

  # @param [Integer] number
  def initialize(number)
    @number = number
  end

  # @return [String]
  def to_s
    "N #{number}"
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

  private

  # @param [Object] value
  # @return [void]
  def check_brick_number(value)
    unless value.is_a?(MeasurementNumber)
      raise "#{value} is not a #{MeasurementNumber}"
    end
  end
end
