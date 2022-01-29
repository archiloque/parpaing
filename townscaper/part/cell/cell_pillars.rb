module CellPillars

  # @return [void]
  def create_pillars_above
    level_index_above = cell_level_index_above
    if level_index_above.nil?
      return
    end
    pillars = pillars_for_cell(Delta::DELTA_UP * (level_index_above - level.index))
    with(
      color: Color::YELLOW,
    ) do
      maybe_create_pillars(pillars) do
        create_pillar_above(level_index_above)
      end
    end
  end

  # For cells with no other cells under
  # @return[void]
  def create_pillars_under
    unless any_cell_under?
      pillars = pillars_for_cell(Delta::DELTA_FIXED)
      maybe_create_pillars(pillars) do
        create_pillar_under
      end
    end
  end

  # @param [Array<Pillar>] pillars
  # @return [void]
  def maybe_create_pillars(pillars)
    with(
      color: Color::YELLOW,
    ) do
      if pillars.include?(Pillar::NORTH_EAST)
        with(
          b_x: 0.to_b,
          b_z: 0.to_b,
        ) do
          yield
        end
      end
      if pillars.include?(Pillar::NORTH_WEST)
        with(
          b_x: Cell::WIDTH_IN_BRICKS - 2.to_b,
          b_z: 0.to_b,
        ) do
          yield
        end
      end
      if pillars.include?(Pillar::SOUTH_EAST)
        with(
          b_x: 0.to_b,
          b_z: Cell::WIDTH_IN_BRICKS - 2.to_b,
        ) do
          yield
        end
      end
      if pillars.include?(Pillar::SOUTH_WEST)
        with(
          b_x: Cell::WIDTH_IN_BRICKS - 2.to_b,
          b_z: Cell::WIDTH_IN_BRICKS - 2.to_b,
        ) do
          yield
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
  def cell_level_index_above
    delta = Delta::DELTA_UP
    (level.index + 1).upto(level.world.levels_number - 1) do |level_index|
      if filled?(delta)
        return level_index
      end
      delta += Delta::DELTA_UP
    end
    nil
  end

  # @return[void]
  def create_pillar_under
    1.upto(level.index - 1) do |level_delta|
      with(
        m_y: (Cell::HEIGHT_IN_UNIT * level_delta) - 8.to_u,
        part: Brick2X2.new,
      ) do
        0.upto(5) do |brick_index|
          add_part(
            b_y: -brick_index.to_b,
          )
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
  end

  # @param [Integer] level_index_above
  # @return[void]
  def create_pillar_above(level_index_above)
    1.upto(level_index_above - level.index - 1) do |level_delta|
      with(
        m_y: -(Cell::HEIGHT_IN_UNIT * level_delta) - 8.to_u,
        part: Brick2X2.new,
      ) do
        0.upto(5) do |brick_index|
          add_part(
            b_y: -brick_index.to_b,
          )
        end
      end
      unless (level.index == 0) && (level_delta == 1)
        add_part(
          m_y: -(Cell::HEIGHT_IN_UNIT * level_delta) - 12.to_u,
          b_y: 0.to_b,
          part: Plate2X2.new,
        )
      end
    end
  end

  # @return [Array<Pillar>]
  # @param [Delta] delta
  def pillars_for_cell(delta)
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

    def inspect
      "Pillar #{@name}"
    end

    NORTH_EAST = Pillar.new('NE')
    NORTH_WEST = Pillar.new('NW')
    SOUTH_EAST = Pillar.new('SE')
    SOUTH_WEST = Pillar.new('SW')
  end
end