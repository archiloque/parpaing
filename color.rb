class Color
  attr_reader :name, :code

  # @param [String] name
  # @param [Integer] code
  def initialize(name:, code:)
    @name = name
    @code = code
  end

  BLUE = Color.new(name: 'blue', code: 1)
  GREEN = Color.new(name: 'green', code: 2)
  DARK_TURQUOISE = Color.new(name: 'dark turquoise', code: 3)
  RED = Color.new(name: 'red', code: 4)
  LIGHT_GRAY = Color.new(name: 'light gray', code: 7)
  YELLOW = Color.new(name: 'yellow', code: 14)
  WHITE = Color.new(name: 'white', code: 15)
  DARK_BLUISH_GRAY = Color.new(name: 'Dark Bluish Gray', code: 72)

end
