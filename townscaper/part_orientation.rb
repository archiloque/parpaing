class PartOrientation
  attr_reader :name, :code

  # @param [String] name
  # @param [String] code
  def initialize(name:, code:)
    @name = name
    @code = code
  end

  O_0 = PartOrientation.new(name: 'Z 0°', code: ' 1 0 0 0 1 0 0 0 1')
  O_90 = PartOrientation.new(name: 'Z 90°', code: '0 0 -1 0 1 0 1 0 0')
  O_180 = PartOrientation.new(name: 'Z 180°', code: '-1 0 0 0 1 0 0 0 -1')
  O_270 = PartOrientation.new(name: 'Z 270°', code: '0 0 1 0 1 0 -1 0 0')
end
