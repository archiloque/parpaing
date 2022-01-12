class Color
  attr_reader :name, :code

  # @param [String] name
  # @param [Integer] code
  def initialize(name:, code:)
    @name = name
    @code = code
  end

  BLUE = Color.new(name: 'Blue', code: 1)
  GREEN = Color.new(name: 'Green', code: 2)
  RED = Color.new(name: 'Red', code: 4)
  WHITE = Color.new(name: 'White', code: 15)
  YELLOW = Color.new(name: 'Yellow', code: 14)

  ALL =
    [
      Color::BLUE,
      Color::GREEN,
      Color::RED,
      Color::WHITE,
      Color::YELLOW,
    ]
end
