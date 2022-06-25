require_relative 'common'

class TestWall < Minitest::Test

  # @param [Array<Array<Boolean>>] level
  # @param [Integer] cell_x
  # @param [Integer] cell_y
  # @param [Boolean] minus_x_wall
  # @param [Boolean] minus_y_wall
  # @param [Boolean] plus_x_wall
  # @param [Boolean] plus_y_wall
  # @return [void]
  def check_cell(level, cell_x, cell_y, minus_x_wall, minus_y_wall, plus_x_wall, plus_y_wall)
    world = World.new(
      level.length,
      level.first.length,
      1,
      [level]
    )
    cell = world.levels.first.cells[cell_y][cell_x]
    assert_equal(minus_x_wall, cell.minus_x_wall, :minus_x_wall)
    assert_equal(minus_y_wall, cell.minus_y_wall, :minus_y_wall)
    assert_equal(plus_x_wall, cell.plus_x_wall, :plus_x_wall)
    assert_equal(plus_y_wall, cell.plus_y_wall, :plus_y_wall)
  end

  def test_single
    check_cell(
      [
        [true],
      ],
      0,
      0,
      true,
      true,
      true,
      true
    )
    check_cell(
      [
        [true, false],
        [false, false],
      ],
      0,
      0,
      true,
      true,
      true,
      true
    )
    check_cell(
      [
        [false, false],
        [true, false],
      ],
      0,
      1,
      true,
      true,
      true,
      true
    )
    check_cell(
      [
        [false, true],
        [false, false],
      ],
      1,
      0,
      true,
      true,
      true,
      true
    )
    check_cell(
      [
        [false, false],
        [false, true],
      ],
      1,
      1,
      true,
      true,
      true,
      true
    )
    check_cell(
      [
        [false, false, false],
        [false, true, false],
        [false, false, false],
      ],
      1,
      1,
      true,
      true,
      true,
      true
    )
  end

  def test_bottom_left
    check_cell(
      [
        [true, false],
        [true, false],
      ],
      0,
      1,
      true,
      true,
      true,
      false
    )
    check_cell(
      [
        [false, false],
        [true, true],
      ],
      0,
      1,
      true,
      true,
      false,
      true
    )
    check_cell(
      [
        [true, false],
        [true, true],
      ],
      0,
      1,
      true,
      true,
      false,
      false
    )
    check_cell(
      [
        [true, true],
        [true, true],
      ],
      0,
      1,
      true,
      true,
      false,
      false
    )
  end

  def test_bottom_right
    check_cell(
      [
        [false, true],
        [false, true],
      ],
      1,
      1,
      true,
      true,
      true,
      false
    )
    check_cell(
      [
        [false, false],
        [true, true],
      ],
      1,
      1,
      false,
      false,
      true,
      false
    )
    check_cell(
      [
        [false, true],
        [true, true],
      ],
      1,
      1,
      false,
      false,
      true,
      false
    )
    check_cell(
      [
        [true, true],
        [true, true],
      ],
      1,
      1,
      false,
      false,
      true,
      false
    )
  end

  def test_top_left
    check_cell(
      [
        [true, false],
        [true, false],
      ],
      0,
      0,
      false,
      false,
      false,
      true
    )
    check_cell(
      [
        [true, true],
        [false, false],
      ],
      0,
      0,
      true,
      true,
      false,
      true
    )
    check_cell(
      [
        [true, true],
        [true, false],
      ],
      0,
      0,
      false,
      false,
      false,
      true
    )
    check_cell(
      [
        [true, true],
        [true, true],
      ],
      0,
      0,
      false,
      false,
      false,
      true
    )
  end

  def test_top_right
    check_cell(
      [
        [false, true],
        [false, true],
      ],
      1,
      0,
      false,
      false,
      false,
      true
    )
    check_cell(
      [
        [true, true],
        [false, false],
      ],
      1,
      0,
      false,
      false,
      true,
      false
    )
    check_cell(
      [
        [true, true],
        [false, true],
      ],
      1,
      0,
      false,
      false,
      false,
      false
    )
    check_cell(
      [
        [true, true],
        [true, true],
      ],
      1,
      0,
      false,
      false,
      false,
      false
    )
  end

  def test_cross
    level = [
      [false, true, false],
      [true, true, true],
      [false, true, false],
    ]

    check_cell(
      level,
      1,
      0,
      true,
      false,
      true,
      true
    )
    check_cell(
      level,
      0,
      1,
      true,
      true,
      false,
      true
    )
    check_cell(
      level,
      1,
      1,
      false,
      false,
      false,
      false
    )
    check_cell(
      level,
      2,
      1,
      false,
      true,
      true,
      true
    )
    check_cell(
      level,
      1,
      2,
      true,
      true,
      true,
      false
    )
  end
end
