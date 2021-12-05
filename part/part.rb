class Part
  BRICK_WIDTH = 20
  BRICK_HEIGHT = 24
  PLATE_HEIGHT = 8
  STUD_HEIGHT = 4
  BASEPLATE_WIDTH = 32

  attr_reader :name, :code, :x, :y, :z

  # @param [String] name
  # @param [String] code
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
end

require_relative 'baseplate'
require_relative 'door'
require_relative 'fence_toward_x'
require_relative 'plate1_x10'
require_relative 'single_brick'
require_relative 'windows'