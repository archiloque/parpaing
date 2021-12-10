require 'set'

module Occupier
  def occupied_bricks
    @occupied_bricks ||= Set.new
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def occupation_key(x:, y:, z:)
    "#{x}-#{y}-#{z}"
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [Set, nil]
  def occupy(x:, y:, z:)
    occupied_bricks.add(occupation_key(x: x, y: y, z: z))
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [Boolean]
  def occupied?(x:, y:, z:)
    occupied_bricks.include?(occupation_key(x: x, y: y, z: z))
  end
end