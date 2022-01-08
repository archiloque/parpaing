class Color
  attr_reader :name, :code

  # @param [String] name
  # @param [Integer] code
  def initialize(name:, code:)
    @name = name
    @code = code
  end

  BLACK = Color.new(name: 'Black', code: 0)
  BLUE = Color.new(name: 'Blue', code: 1)

  ALL =
    [
      Color::BLACK,
      Color::BLUE,
    ]
end
