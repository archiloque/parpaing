class Emitter
  # @param [String] part_name
  # @param [String] part_code
  # @param [Color] color
  # @param [PartOrientation] orientation
  # @param [Integer] x
  # @param [Integer] y
  # @param [Integer] z
  # @return [String]
  def self.emit(part_name:, part_code:, color:, orientation:, x:, y:, z:)
    comment("#{part_name}, color: #{color.name}, position: (#{x.to_i}, #{y}, #{z}), orientation: #{orientation.name}") +
      "1 #{color.code} #{x.to_i} #{y.to_i} #{z.to_i} #{orientation.code} #{part_code}.dat\n"
  end

  # @return [String]
  # @param [String] content
  def self.comment(content)
    "0 \\\\ #{content}\n"
  end
end
