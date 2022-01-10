class Color
  attr_reader :name, :code

  # @param [String] name
  # @param [Integer] code
  def initialize(name:, code:)
    @name = name
    @code = code
  end

  BLUE = Color.new(name: 'Blue', code: 1)
  YELLOW = Color.new(name: 'Yellow', code: 14)

  ALL =
    [
      Color::BLUE,
      Color::YELLOW,
    ]
end
