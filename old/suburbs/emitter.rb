class Emitter
  # @param [Part] part
  # @param [String] part_code
  # @param [Color] color
  # @param [PartOrientation] orientation
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def self.emit(part:, color:, orientation:, x:, y:, z:)
    comment("#{part.name}, color: #{color.name}, position: (#{x.to_i}, #{y.to_i}, #{z.to_i}), orientation: #{orientation.name}") +
      "1 #{color.code} #{x.to_i} #{y.to_i} #{z.to_i} #{orientation.code} #{part.code}.dat\n"
  end

  # @return [String]
  # @param [String] content
  def self.comment(content)
    "0 \\\\ #{content}\n"
  end
end
