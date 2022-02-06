module CellPillars
  # @return [Integer, nil]
  attr_reader :cell_level_index_above

  # @return [Array<CellPillars::Pillar>]
  attr_reader :pillars_for_cell

  def initialize_pillars
    @cell_level_index_above = calculate_cell_level_index_above
    if @cell_level_index_above
      @pillars_for_cell = calculate_pillars_for_cell(Delta::DELTA_UP * (@cell_level_index_above - level.index))
    else
      @pillars_for_cell = []
    end
  end

  # @return [Boolean]
  def pillar_north_east?
    pillars_for_cell.include?(Pillar::NORTH_EAST)
  end

  # @return [Boolean]
  def pillar_north_west?
    pillars_for_cell.include?(Pillar::NORTH_WEST)
  end

  # @return [Boolean]
  def pillar_south_east?
    pillars_for_cell.include?(Pillar::SOUTH_EAST)
  end

  # @return [Boolean]
  def pillar_south_west?
    pillars_for_cell.include?(Pillar::SOUTH_WEST)
  end

  # @return [void]
  def create_pillars_above
    with(
      color: Color::YELLOW,
    ) do
      iterate_on_pillars_positions(pillars_for_cell) do |pillar|
        create_pillar_above(cell_level_index_above, pillar)
      end
    end
  end

  # For cells with no other cells under
  # @return[void]
  def create_pillars_under
    unless any_cell_under?
      pillars = calculate_pillars_for_cell(Delta::DELTA_FIXED)
      iterate_on_pillars_positions(pillars) do |pillar|
        create_pillar_under(pillar)
      end
    end
  end

  # @param [Array<Pillar>] pillars
  # @return [void]
  def iterate_on_pillars_positions(pillars)
    with(
      color: Color::YELLOW,
    ) do
      if pillars.include?(Pillar::NORTH_EAST)
        with(
          b_x: 0.to_b,
          b_z: 0.to_b,
        ) do
          yield(Pillar::NORTH_EAST)
        end
      end
      if pillars.include?(Pillar::NORTH_WEST)
        with(
          b_x: Cell::WIDTH_IN_BRICKS - 2.to_b,
          b_z: 0.to_b,
        ) do
          yield(Pillar::NORTH_WEST)
        end
      end
      if pillars.include?(Pillar::SOUTH_EAST)
        with(
          b_x: 0.to_b,
          b_z: Cell::WIDTH_IN_BRICKS - 2.to_b,
        ) do
          yield(Pillar::SOUTH_EAST)
        end
      end
      if pillars.include?(Pillar::SOUTH_WEST)
        with(
          b_x: Cell::WIDTH_IN_BRICKS - 2.to_b,
          b_z: Cell::WIDTH_IN_BRICKS - 2.to_b,
        ) do
          yield(Pillar::SOUTH_WEST)
        end
      end
    end
  end

  # @return [Boolean]
  def any_cell_under?
    (level.index - 1).downto(0) do |level_index|
      if level.world.filled?(
        column: x_index,
        line: z_index,
        level: level_index,
      )
        return true
      end
    end
    false
  end

  # @return [Integer, nil]
  def calculate_cell_level_index_above
    delta = Delta::DELTA_UP
    (level.index + 1).upto(level.world.levels_number - 1) do |level_index|
      if filled?(delta)
        return level_index
      end
      delta += Delta::DELTA_UP
    end
    nil
  end

  # @param [Pillar] pillar
  # @return[void]
  def create_pillar_under(pillar)
    1.upto(level.index - 1) do |level_delta|
      with(
        m_y: (Cell::HEIGHT_IN_UNIT * level_delta) - 8.to_u,
        part: Brick2X2.new,
      ) do
        0.upto(5) do |brick_index|
          unless (level_delta == 1) && (brick_index == 5)
            add_part(
              b_y: -brick_index.to_b,
            )
          end
        end
      end
      add_part(
        m_y: (Cell::HEIGHT_IN_UNIT * level_delta) - 12.to_u,
        b_y: 0.to_b,
        part: Plate2X2.new,
      )
    end

    with(
      m_y: (Cell::HEIGHT_IN_UNIT * (level.index - 1)),
      part: Brick2X2.new,
    ) do
      add_part(
        b_y: 1.to_b,
      )
      add_part(
        b_y: 2.to_b,
      )
    end

    with(
      b_y: 1.to_b,
      m_y: 0.to_u,
    ) do
      create_pillar_top(pillar)
    end
  end

  # @param [Pillar] pillar
  # @return [void]
  def create_pillar_top(pillar)
    case pillar
    when Pillar::NORTH_WEST
      add_part(
        b_x: Cell::WIDTH_IN_BRICKS - 2.to_b,
        b_z: 1.to_b,
        part: SlopeInverted452X2DoubleConvexSouthEast.new
      )
      add_part(
        b_x: Cell::WIDTH_IN_BRICKS - 1.to_b,
        b_z: 1.to_b,
        part: Slope452X1South.new
      )
      add_part(
        b_x: Cell::WIDTH_IN_BRICKS - 2.to_b,
        b_z: 0.to_b,
        part: Slope452X1East.new
      )
      add_part(
        b_x: Cell::WIDTH_IN_BRICKS - 1.to_b,
        b_z: 0.to_b,
        part: Brick1X1.new
      )
    when Pillar::NORTH_EAST
      add_part(
        b_x: 1.to_b,
        b_z: 1.to_b,
        part: SlopeInverted452X2DoubleConvexSouthWest.new
      )
      add_part(
        b_x: 0.to_b,
        b_z: 1.to_b,
        part: Slope452X1South.new
      )
      add_part(
        b_x: 1.to_b,
        b_z: 0.to_b,
        part: Slope452X1West.new
      )
      add_part(
        b_x: 0.to_b,
        b_z: 0.to_b,
        part: Brick1X1.new
      )
    when Pillar::SOUTH_WEST
      add_part(
        b_x: Cell::WIDTH_IN_BRICKS - 2.to_b,
        b_z: Cell::WIDTH_IN_BRICKS - 2.to_b,
        part: SlopeInverted452X2DoubleConvexNorthEast.new
      )
      add_part(
        b_x: Cell::WIDTH_IN_BRICKS - 1.to_b,
        b_z: Cell::WIDTH_IN_BRICKS - 2.to_b,
        part: Slope452X1North.new
      )
      add_part(
        b_x: Cell::WIDTH_IN_BRICKS - 2.to_b,
        b_z: Cell::WIDTH_IN_BRICKS - 1.to_b,
        part: Slope452X1East.new
      )
      add_part(
        b_x: Cell::WIDTH_IN_BRICKS - 1.to_b,
        b_z: Cell::WIDTH_IN_BRICKS - 1.to_b,
        part: Brick1X1.new
      )
    when Pillar::SOUTH_EAST
      add_part(
        b_x: 1.to_b,
        b_z: Cell::WIDTH_IN_BRICKS - 2.to_b,
        part: SlopeInverted452X2DoubleConvexNorthWest.new
      )
      add_part(
        b_x: 0.to_b,
        b_z: Cell::WIDTH_IN_BRICKS - 2.to_b,
        part: Slope452X1North.new
      )
      add_part(
        b_x: 1.to_b,
        b_z: Cell::WIDTH_IN_BRICKS - 1.to_b,
        part: Slope452X1West.new
      )
      add_part(
        b_x: 0.to_b,
        b_z: Cell::WIDTH_IN_BRICKS - 1.to_b,
        part: Brick1X1.new
      )
    end
  end

  # @param [Integer] level_index_above
  # @param [Pillar] pillar
  # @return[void]
  def create_pillar_above(level_index_above, pillar)
    1.upto(level_index_above - level.index - 1) do |level_delta|
      with(
        m_y: -(Cell::HEIGHT_IN_UNIT * level_delta) - 8.to_u,
        part: Brick2X2.new,
      ) do
        1.upto(5) do |brick_index|
          unless (level_delta == (level_index_above - level.index - 1)) && (brick_index == 5)
            add_part(
              b_y: -brick_index.to_b,
            )
          end
        end
      end
      if (level.index == 0) && (level_delta == 1)
        add_part(
          m_y: -(Cell::HEIGHT_IN_UNIT * level_delta) - 8.to_u,
          b_y: 0.to_b,
          part: Brick2X2.new,
        )
      else
        add_part(
          m_y: -(Cell::HEIGHT_IN_UNIT * level_delta),
          b_y: 0.to_b,
          part: Brick2X2.new,
        )
        add_part(
          m_y: -(Cell::HEIGHT_IN_UNIT * level_delta) - 12.to_u,
          b_y: -1.to_b,
          part: Plate2X2.new,
        )
      end
    end
    with(
      m_y: -(Cell::HEIGHT_IN_UNIT * (level_index_above - level.index - 1)) - 8.to_u,
      b_y: -5.to_b,
    ) do
      create_pillar_top(pillar)
    end
  end

  # @return [Array<Pillar>]
  # @param [Delta] delta
  def calculate_pillars_for_cell(delta)
    result = []
    unless filled?(Delta::DELTA_NORTH + delta) || filled?(Delta::DELTA_EAST + delta)
      result << Pillar::NORTH_EAST
    end
    unless filled?(Delta::DELTA_NORTH + delta) || filled?(Delta::DELTA_WEST + delta)
      result << Pillar::NORTH_WEST
    end
    unless filled?(Delta::DELTA_SOUTH + delta) || filled?(Delta::DELTA_EAST + delta)
      result << Pillar::SOUTH_EAST
    end
    unless filled?(Delta::DELTA_SOUTH + delta) || filled?(Delta::DELTA_WEST + delta)
      result << Pillar::SOUTH_WEST
    end
    result
  end

  class Pillar
    def initialize(name)
      @name = name
    end

    def to_s
      "Pillar #{@name}"
    end

    NORTH_EAST = Pillar.new('NE')
    NORTH_WEST = Pillar.new('NW')
    SOUTH_EAST = Pillar.new('SE')
    SOUTH_WEST = Pillar.new('SW')
  end
end