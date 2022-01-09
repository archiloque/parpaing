class Emitter
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
        raise "#{k} is not a MeasurementNumber"
      end
    end
    comment("#{part.name}, color: #{color.name}, position: (#{x.number}, #{y.number}, #{z.number}), orientation: #{orientation.name}") +
      "1 #{color.code} #{x.number} #{y.number} #{z.number} #{orientation.code} #{part.code}.dat\n"
  end

  # @return [String]
  # @param [String] content
  def self.comment(content)
    "0 \\\\ #{content}\n"
  end
end
