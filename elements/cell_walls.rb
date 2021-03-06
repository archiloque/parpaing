module CellWalls
  def initialize_walls
    @plus_y_wall = !((minus_x_filled? && (!minus_x_plus_y_filled?)) || plus_y_filled?)
    @minus_y_wall = !((minus_x_filled? && (!minus_x_minus_y_filled?)) || minus_y_filled?)

    @plus_x_wall = !(plus_x_filled? || (minus_y_filled? && (!plus_x_minus_y_filled?)))
    @minus_x_wall = !(minus_x_filled? || (minus_y_filled? && (!minus_x_minus_y_filled?)))
  end

  private

  # @param [USDA] usda
  # @return [void]
  def create_walls(usda)
    usda.with(
      material: Material::YELLOW,
    ) do
      usda.create_rectangular_cuboid(
        dimension: Usda::Dimension.new(x: Cell::HOUSE_WIDTH, y: Cell::HOUSE_WIDTH, z: 1),
        position: Usda::Coordinates.new(x: 0, y: 0, z: 0)
      )

      if @plus_y_wall
        wall_in_plus_y = wall_in_direction(Delta::DELTA_PLUS_X, Delta::DELTA_PLUS_Y)
        create_plus_y_wall(usda, wall_in_plus_y)
      end
      if @minus_y_wall
        wall_in_minus_y = wall_in_direction(Delta::DELTA_PLUS_X, Delta::DELTA_MINUS_Y)
        create_minus_y_wall(usda, wall_in_minus_y)
      end
      if @plus_x_wall
        wall_in_plus_x = wall_in_direction(Delta::DELTA_PLUS_Y, Delta::DELTA_PLUS_X)
        create_plus_x_wall(usda, wall_in_plus_x)
      end
      if @minus_x_wall
        wall_in_minus_x = wall_in_direction(Delta::DELTA_PLUS_Y, Delta::DELTA_MINUS_X)
        create_minus_x_wall(usda, wall_in_minus_x)
      end
    end
  end

  # @param [USDA] usda
  # @param [WallInDirectionResult] wall_in
  # @return [void]
  def create_minus_y_wall(usda, wall_in)
    create_y_wall(usda, wall_in, 0.0)
  end

  # @param [USDA] usda
  # @param [WallInDirectionResult] wall_in
  # @return [void]
  def create_plus_y_wall(usda, wall_in)
    usda.with(
      position: Usda::Coordinates.new(
        x: 0,
        y: Cell::HOUSE_WIDTH - 1,
        z: 0,
      ),
    ) do
      create_y_wall(usda, wall_in, 1 - WINDOW_WITH)
    end
  end

  # @param [USDA] usda
  # @param [WallInDirectionResult] wall_in
  # @return [void]
  def create_minus_x_wall(usda, wall_in)
    create_x_wall(usda, wall_in, 0.0)
  end

  # @param [USDA] usda
  # @param [WallInDirectionResult] wall_in
  # @return [void]
  def create_plus_x_wall(usda, wall_in)
    usda.with(
      position: Usda::Coordinates.new(
        x: Cell::HOUSE_WIDTH - 1,
        y: 0,
        z: 0,
      ),
    ) do
      create_x_wall(usda, wall_in, 1 - WINDOW_WITH)
    end
  end

  # @param [USDA] usda
  # @param [WallInDirectionResult] wall_in
  # @param [Float] windows_delta
  # @return [void]
  def create_x_wall(usda, wall_in, windows_delta)
    total_y =
      (Cell::HOUSE_WIDTH * (wall_in.length + 1)) - 2 +
        (wall_in.corner_begin ? 2 : 0) +
        (wall_in.corner_end ? 2 : 0)
    initial_y = wall_in.corner_begin ? -1 : 1

    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: 1, y: total_y, z: 3),
      position: Usda::Coordinates.new(x: 0, y: initial_y, z: 1),
    )
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: 1, y: total_y, z: 1),
      position: Usda::Coordinates.new(x: 0, y: initial_y, z: 6),
    )

    dimension_y = Cell::BETWEEN_WINDOWS_LENGTH - (wall_in.corner_begin ? 0 : 2)
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: 1, y: dimension_y, z: 2),
      position: Usda::Coordinates.new(x: 0, y: initial_y, z: 4),
    )

    dimension_y = Cell::BETWEEN_WINDOWS_LENGTH - (wall_in.corner_end ? 0 : 2)
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: 1, y: dimension_y, z: 2),
      position: Usda::Coordinates.new(x: 0, y: total_y - dimension_y - 1 + (wall_in.corner_begin ? 0 : 2), z: 4),
    )

    create_x_axis_window(usda, windows_delta, Cell::BETWEEN_WINDOWS_LENGTH - 1)

    0.upto(wall_in.length - 1) do |between_block|
      y = (Cell::HOUSE_WIDTH - Cell::BETWEEN_WINDOWS_LENGTH) + (Cell::HOUSE_WIDTH * between_block) + 1
      usda.create_rectangular_cuboid(
        dimension: Usda::Dimension.new(x: 1, y: Cell::BETWEEN_WINDOWS_LENGTH * 2 - 2, z: 2),
        position: Usda::Coordinates.new(x: 0, y: y, z: 4),
      )
      create_x_axis_window(usda, windows_delta, y + 6)
    end
  end

  # @param [USDA] usda
  # @param [WallInDirectionResult] wall_in
  # @param [Float] windows_delta
  # @return [void]
  def create_y_wall(usda, wall_in, windows_delta)
    total_x = Cell::HOUSE_WIDTH * (wall_in.length + 1)
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: total_x, y: 1, z: 3),
      position: Usda::Coordinates.new(x: 0, y: 0, z: 1),
    )
    usda.create_rectangular_cuboid(
      dimension: Usda::Dimension.new(x: total_x, y: 1, z: 1),
      position: Usda::Coordinates.new(x: 0, y: 0, z: 6),
    )

    usda.with(
      dimension: Usda::Dimension.new(x: Cell::BETWEEN_WINDOWS_LENGTH - 1, y: 1, z: 2),
    ) do
      usda.create_rectangular_cuboid(
        position: Usda::Coordinates.new(x: 0, y: 0, z: 4),
      )
      usda.create_rectangular_cuboid(
        position: Usda::Coordinates.new(x: total_x - Cell::BETWEEN_WINDOWS_LENGTH + 1, y: 0, z: 4),
      )
    end

    create_y_axis_window(usda, windows_delta, Cell::BETWEEN_WINDOWS_LENGTH - 1)

    0.upto(wall_in.length - 1) do |between_block|
      x = (Cell::HOUSE_WIDTH - Cell::BETWEEN_WINDOWS_LENGTH) + (Cell::HOUSE_WIDTH * between_block) + 1
      usda.create_rectangular_cuboid(
        dimension: Usda::Dimension.new(x: Cell::BETWEEN_WINDOWS_LENGTH * 2 - 2, y: 1, z: 2),
        position: Usda::Coordinates.new(x: x, y: 0, z: 4),
      )
      create_y_axis_window(usda, windows_delta, x + 6)
    end
  end

  WINDOW_WITH = 0.2

  # @param [USDA] usda
  # @param [Float] windows_delta
  # @param [Integer] y
  # @return [void]
  def create_x_axis_window(usda, windows_delta, y)
    usda.with(
      material: Material::GREEN,
    ) do
      usda.with(
        dimension: Usda::Dimension.new(x: WINDOW_WITH, y: 6, z: WINDOW_WITH),
      ) do
        usda.create_rectangular_cuboid(
          position: Usda::Coordinates.new(x: windows_delta, y: y, z: 4)
        )
        usda.create_rectangular_cuboid(
          position: Usda::Coordinates.new(x: windows_delta, y: y, z: 6 - WINDOW_WITH)
        )
      end

      usda.with(
        dimension: Usda::Dimension.new(x: WINDOW_WITH, y: WINDOW_WITH, z: 2 - (2 * WINDOW_WITH)),
      ) do
        usda.create_rectangular_cuboid(
          position: Usda::Coordinates.new(x: windows_delta, y: y, z: 4 + WINDOW_WITH)
        )
        usda.create_rectangular_cuboid(
          position: Usda::Coordinates.new(x: windows_delta, y: y + 3 - (WINDOW_WITH / 2), z: 4 + WINDOW_WITH)
        )
        usda.create_rectangular_cuboid(
          position: Usda::Coordinates.new(x: windows_delta, y: y + 6 - WINDOW_WITH, z: 4 + WINDOW_WITH)
        )
      end
    end
    usda.with(
      material: Material::GLASS,
      dimension: Usda::Dimension.new(x: WINDOW_WITH, y: 3 - (1.5 * WINDOW_WITH), z: 2 - (2 * WINDOW_WITH))
    ) do
      usda.create_rectangular_cuboid(
        position: Usda::Coordinates.new(x: windows_delta, y: y + WINDOW_WITH, z: 4 + WINDOW_WITH)
      )
      usda.create_rectangular_cuboid(
        position: Usda::Coordinates.new(x: windows_delta, y: y + 3 + (WINDOW_WITH / 2), z: 4 + WINDOW_WITH)
      )
    end
  end

  # @param [USDA] usda
  # @param [Float] windows_delta
  # @param [Integer] x
  # @return [void]
  def create_y_axis_window(usda, windows_delta, x)
    usda.with(
      material: Material::GREEN,
    ) do
      usda.with(
        dimension: Usda::Dimension.new(x: 6, y: WINDOW_WITH, z: WINDOW_WITH),
      ) do
        usda.create_rectangular_cuboid(
          position: Usda::Coordinates.new(x: x, y: windows_delta, z: 4),
        )
        usda.create_rectangular_cuboid(
          position: Usda::Coordinates.new(x: x, y: windows_delta, z: 6 - WINDOW_WITH),
        )
      end

      usda.with(
        dimension: Usda::Dimension.new(x: WINDOW_WITH, y: WINDOW_WITH, z: 2 - (2 * WINDOW_WITH)),
      ) do
        usda.create_rectangular_cuboid(
          position: Usda::Coordinates.new(x: x, y: windows_delta, z: 4 + WINDOW_WITH),
        )
        usda.create_rectangular_cuboid(
          position: Usda::Coordinates.new(x: x + 3 - (WINDOW_WITH / 2), y: windows_delta, z: 4 + WINDOW_WITH),
        )
        usda.create_rectangular_cuboid(
          position: Usda::Coordinates.new(x: x + 6 - WINDOW_WITH, y: windows_delta, z: 4 + WINDOW_WITH),
        )
      end
    end

    usda.with(
      material: Material::GLASS,
      dimension: Usda::Dimension.new(x: 3 - (1.5 * WINDOW_WITH), y: WINDOW_WITH, z: 2 - (2 * WINDOW_WITH)),
    ) do
      usda.create_rectangular_cuboid(
        position: Usda::Coordinates.new(x: x + WINDOW_WITH, y: windows_delta, z: 4 + WINDOW_WITH),
      )
      usda.create_rectangular_cuboid(
        position: Usda::Coordinates.new(x: x + 3 + (WINDOW_WITH / 2), y: windows_delta, z: 4 + WINDOW_WITH),
      )
    end
  end

  # @param [Delta] direction_to_move
  # @param [Delta] direction_to_check
  # @return [WallInDirectionResult]
  def wall_in_direction(direction_to_move, direction_to_check)
    length = 0
    delta = direction_to_move
    while filled?(delta) && !filled?(delta + direction_to_check)
      length += 1
      delta += direction_to_move
    end
    WallInDirectionResult.new(
      length,
      filled?(-direction_to_move),
      filled?(delta) && filled?(delta + direction_to_check)
    )
  end

  class WallInDirectionResult
    # @return [Integer]
    attr_reader :length
    # @return [Boolean]
    attr_reader :corner_begin
    # @return [Boolean]
    attr_reader :corner_end

    # @param [Integer] length
    # @param [Boolean] corner_begin
    # @param [Boolean] corner_end
    def initialize(length, corner_begin, corner_end)
      @length = length
      @corner_begin = corner_begin
      @corner_end = corner_end
    end

    def to_s
      "#{self.class} length: #{length}, corner_begin: #{corner_begin}, corner_end: #{corner_end}"
    end
  end
end
