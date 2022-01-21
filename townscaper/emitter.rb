class Emitter
  # @param [Color, nil] color
  def self.patch_color(color)
    @color = color
  end

  # @param [Part] part
  # @param [String] part_code
  # @param [Color] color
  # @param [PartOrientation] orientation
  # @param [UnitNumber] x
  # @param [UnitNumber] y
  # @param [UnitNumber] z
  # @return [String]
  def self.emit(part:, color:, orientation:, x:, y:, z:)
    {
      x: x,
      y: y,
      z: z,
    }.each_pair do |k, v|
      unless v.is_a?(DrawUnit)
        raise "#{k} is not a #{DrawUnit}"
      end
    end
    color = @color || color
    #comment("#{part.name}, #{color.name}, (#{x.number}, #{y.number}, #{z.number}), #{orientation.name}") +
    "1 #{color.code} #{x.number} #{y.number} #{z.number} #{orientation.code} #{part.code}.dat\n"
  end

  # @return [String]
  # @param [String] content
  def self.comment(content)
    "0 \\\\ #{content}\n"
  end
end
