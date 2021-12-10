class PartOrientation
  attr_reader :name, :code

  # @param [String] name
  # @param [String] code
  def initialize(name:, code:)
    @name = name
    @code = code
  end

  DEFAULT = PartOrientation.new(name: 'Default', code: ' 1 0 0 0 1 0 0 0 1')
  Z_90 = PartOrientation.new(name: 'Z 90°', code: '0 0 -1 0 1 0 1 0 0')
  Z_180 = PartOrientation.new(name: 'Z 180°', code: '-1 0 0 0 1 0 0 0 -1')
  Z_270 = PartOrientation.new(name: 'Z 270°', code: '0 0 1 0 1 0 -1 0 0')
end
