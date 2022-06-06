class SetPart
  # @param [Color] color
  # @param [UnitNumber] x
  # @param [UnitNumber] y
  # @param [UnitNumber] z
  # @return [Array<String>]
  def create(color:, x:, y:, z:)
    raise NotImplementedError
  end

  # @param [NumberOfBrick] target_length
  # @param [Hash{Integer->Class}] parts
  # @return [Array<Class>]
  def self.calculate_fit(target_length, parts)
    result = []
    current_index = 0
    remaining_length = target_length.number
    parts_width = parts.keys.sort.reverse
    while remaining_length > 0
      while remaining_length < parts_width[current_index]
        current_index += 1
      end
      while remaining_length >= parts_width[current_index]
        result << FitElement.new(parts_width[current_index].to_b, parts[parts_width[current_index]])
        remaining_length -= parts_width[current_index]
      end
    end
    result
  end

  class FitElement
    # @return [NumberOfBrick]
    attr_reader :size

    # @return [part_class]
    attr_reader :part_class

    # @param [NumberOfBrick] size
    # @param [Class] part_class
    def initialize(size, part_class)
      @size = size
      @part_class = part_class
    end
  end
end
