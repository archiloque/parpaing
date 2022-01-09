require 'set'

module Occupier
  def occupied_bricks
    @occupied_bricks ||= Set.new
  end

  # @param [BrickNumber] x
  # @param [BrickNumber] y
  # @param [BrickNumber] z
  # @return [String]
  def occupation_key(x:, y:, z:)
    "#{x.number},#{y.number},#{z.number}"
  end

  # @param [BrickNumber] x
  # @param [BrickNumber] y
  # @param [BrickNumber] z
  # @return [void]
  def occupy(x:, y:, z:)
    occupied_bricks.add(occupation_key(x: x, y: y, z: z))
  end

  # @param [BrickNumber] from_x
  # @param [BrickNumber] to_x
  # @param [BrickNumber] y
  # @param [BrickNumber] from_z
  # @param [BrickNumber] to_z
  # @return [void]
  def occupy_zone(from_x:, to_x:, y:, from_z:, to_z:)
    from_x.upto(to_x) do |x|
      from_z.upto(to_z) do |z|
        occupied_bricks.add(occupation_key(x: x, y: y, z: z))
      end
    end
  end

  # @param [BrickNumber] x
  # @param [BrickNumber] y
  # @param [BrickNumber] z
  # @return [Boolean]
  def occupied?(x:, y:, z:)
    occupied_bricks.include?(occupation_key(x: x, y: y, z: z))
  end

  # @param [BrickNumber] from_x
  # @param [BrickNumber] to_x
  # @param [BrickNumber] y
  # @param [BrickNumber] from_z
  # @param [BrickNumber] to_z
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
