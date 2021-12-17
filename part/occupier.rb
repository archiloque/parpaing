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
    "#{x},#{y},#{z}"
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [void]
  def occupy(x:, y:, z:)
    occupied_bricks.add(occupation_key(x: x, y: y, z: z))
  end

  # @param [Integer] from_x
  # @param [Integer] to_x
  # @param [Integer] y
  # @param [Integer] from_z
  # @param [Integer] to_z
  # @return [void]
  def occupy_zone(from_x:, to_x:, y:, from_z:, to_z:)
    from_x.upto(to_x) do |x|
      from_z.upto(to_z) do |z|
        occupied_bricks.add(occupation_key(x: x, y: y, z: z))
      end
    end
  end

  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [Boolean]
  def occupied?(x:, y:, z:)
    occupied_bricks.include?(occupation_key(x: x, y: y, z: z))
  end

  # @param [Integer] from_x
  # @param [Integer] to_x
  # @param [Integer] y
  # @param [Integer] from_z
  # @param [Integer] to_z
  # @return [Boolean]
  def occupied_zone?(from_x:, to_x:, y:, from_z:, to_z:)
    from_x.upto(to_x) do |x|
      from_z.upto(to_z) do |z|
        if occupied?(x: x, y: y, z: z)
          return true
        end
      end
    end
    false
  end
end