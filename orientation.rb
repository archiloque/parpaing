class Orientation
  attr_reader :name, :code

  # @param [String] name
  # @param [String] code
  def initialize(name:, code:)
    @name = name
    @code = code
  end

  DEFAULT = Orientation.new(name: 'Default', code: ' 1 0 0 0 1 0 0 0 1')
  Z_90 = Orientation.new(name: 'Z 90°', code: '0 0 -1 0 1 0 1 0 0')
  Z_270 = Orientation.new(name: 'Z 270°', code: '0 0 1 0 1 0 -1 0 0')
end
