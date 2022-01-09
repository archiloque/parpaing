require 'set'

module Occupier
  include Common
  def occupied_bricks
    @occupied_bricks ||= Set.new
  end

  # @param [NumberOfBrick] x
  # @param [NumberOfBrick] y
  # @param [NumberOfBrick] z
  # @return [String]
  def occupation_key(x:, y:, z:)
    {
      x: x,
      y: y,
      z: z,
    }.each_pair do |k, v|
      unless v.is_a?(NumberOfBrick)
        raise "#{k} is not a #{NumberOfBrick}"
      end
    end
    "#{x.number},#{y.number},#{z.number}"
  end

  # @param [NumberOfBrick] x
  # @param [NumberOfBrick] y
  # @param [NumberOfBrick] z
  # @return [void]
  def occupy(x:, y:, z:)
    occupied_bricks.add(occupation_key(x: x, y: y, z: z))
  end

  # @param [NumberOfBrick] from_x
  # @param [NumberOfBrick] to_x
  # @param [NumberOfBrick] y
  # @param [NumberOfBrick] from_z
  # @param [NumberOfBrick] to_z
  # @return [void]
  def occupy_zone(from_x:, to_x:, y:, from_z:, to_z:)
    from_x.upto(to_x) do |x|
      from_z.upto(to_z) do |z|
        occupied_bricks.add(occupation_key(x: x, y: y, z: z))
      end
    end
  end

  # @param [NumberOfBrick] x
  # @param [NumberOfBrick] y
  # @param [NumberOfBrick] z
  # @return [Boolean]
  def occupied?(x:, y:, z:)
    occupied_bricks.include?(occupation_key(x: x, y: y, z: z))
  end

  # @param [NumberOfBrick] from_x
  # @param [NumberOfBrick] to_x
  # @param [NumberOfBrick] y
  # @param [NumberOfBrick] from_z
  # @param [NumberOfBrick] to_z
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
