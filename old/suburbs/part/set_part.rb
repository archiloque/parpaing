class SetPart
  include Measures
  # @return [BrickNumber]
  attr_reader :x
  # @return [BrickNumber]
  attr_reader :y
  # @return [BrickNumber]
  attr_reader :z

  # @param [BrickNumber] x
  # @param [BrickNumber] y
  # @param [BrickNumber] z
  def initialize(x:, y:, z:)
    @x = x
    @y = y
    @z = z
  end

  # @param [Color] color
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [Array<String>]
  def create(color:, x:, y:, z:)
    raise NotImplementedError
  end

  # @param [Integer] target_length
  # @param [Hash{Integer->Class}] parts
  # @return [Array<Class>]
  def self.calculate_fit(target_length, parts)
    result = []
    current_index = 0
    remaining_length = target_length
    parts_width = parts.keys.sort.reverse
    while remaining_length > 0
      while remaining_length < parts_width[current_index]
        current_index += 1
      end
      while remaining_length >= parts_width[current_index]
        result << parts[parts_width[current_index]]
        remaining_length -= parts_width[current_index]
      end
    end
    result
  end
end
