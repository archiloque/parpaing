class Part
  BRICK_WIDTH = 20
  BRICK_HEIGHT = 24
  PLATE_HEIGHT = 8
  STUD_HEIGHT = 4
  BASEPLATE_WIDTH = 32

  attr_reader :name, :code, :x, :y, :z

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
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

require_relative 'occupier'
require_relative 'with_result'

require_relative 'brick'
require_relative 'baseplate'
require_relative 'door'
require_relative 'fence'
require_relative 'house'
require_relative 'houses_block'
require_relative 'lamp_post'
require_relative 'mailbox'
require_relative 'plants'
require_relative 'plate'
require_relative 'windows/windows'