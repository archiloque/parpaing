class SetPart
  # @param [Color] color
  # @param [MeasurementNumber] x
  # @param [MeasurementNumber] y
  # @param [MeasurementNumber] z
  # @return [Array<String>]
  def create(color:, x:, y:, z:)
    raise NotImplementedError
  end

  # @param [BrickNumber] target_length
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
        result << parts[parts_width[current_index]]
        remaining_length -= parts_width[current_index]
      end
    end
    result
  end
end
