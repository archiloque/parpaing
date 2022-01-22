module CellBasement

  def create_basement
    with(
      color: Color::YELLOW,
      m_y: @y_origin + (1.to_b * Measures::BRICK_HEIGHT),
    ) do
      create_basement_north
      create_basement_south
      create_basement_west
      create_basement_east
    end
  end

  def create_basement_east_north()
    if north_filled?
      if north_east_filled?
        add_part(
          b_x: @x_origin,
          b_y: 0.to_b,
          b_z: @z_origin,
          part: Brick1X3Z.new,
        )
        add_part(
          b_x: @x_origin,
          b_y: 1.to_b,
          b_z: @z_origin,
          part: Brick1X4Z.new,
        )
      end
    else
      add_part(
        b_x: @x_origin,
        b_y: 0.to_b,
        b_z: @z_origin + 1.to_b,
        part: Brick1X2Z.new,
      )
      add_part(
        b_x: @x_origin,
        b_y: 1.to_b,
        b_z: @z_origin,
        part: Brick1X4Z.new,
      )
    end
  end

  def create_basement_east_south
    if south_filled?
      if south_east_filled?
        add_part(
          b_x: @x_origin,
          b_y: 0.to_b,
          b_z: @z_origin + 8.to_b,
          part: Brick1X4Z.new,
        )
        add_part(
          b_x: @x_origin,
          b_y: 1.to_b,
          b_z: @z_origin + 8.to_b,
          part: Brick1X4Z.new,
        )
      else
        add_part(
          b_x: @x_origin,
          b_y: 0.to_b,
          b_z: @z_origin + 9.to_b,
          part: ArchZ.new,
        )
        add_part(
          b_x: @x_origin,
          b_y: 1.to_b,
          b_z: @z_origin + 8.to_b,
          part: Brick1X2Z.new,
        )
        add_part(
          b_x: @x_origin,
          b_y: 1.to_b,
          b_z: @z_origin + 14.to_b,
          part: Brick1X2Z.new,
        )
      end
    else
      add_part(
        b_x: @x_origin,
        b_y: 0.to_b,
        b_z: @z_origin + 9.to_b,
        part: Brick1X2Z.new,
      )
      add_part(
        b_x: @x_origin,
        b_y: 1.to_b,
        b_z: @z_origin + 8.to_b,
        part: Brick1X4Z.new,
      )
    end
  end

  private

  def create_basement_north
    if north_filled?
    else
      add_part(
        b_x: @x_origin + 3.to_b,
        b_y: 0.to_b,
        b_z: @z_origin,
        part: ArchX.new,
      )
      create_basement_north_east
      create_basement_north_west
    end
  end

  def create_basement_south
    if south_filled?
    else
      add_part(
        b_x: @x_origin + 3.to_b,
        b_y: 0.to_b,
        b_z: @z_origin + 11.to_b,
        part: ArchX.new,
      )
      create_basement_south_east
      create_basement_south_west
    end
  end

  def create_basement_north_east
    if east_filled?
      if north_east_filled?
        add_part(
          b_x: @x_origin,
          b_y: 0.to_b,
          b_z: @z_origin,
          part: Brick1X3X.new,
        )
        add_part(
          b_x: @x_origin,
          b_y: 1.to_b,
          b_z: @z_origin,
          part: Brick1X4X.new,
        )
      end
    else
      add_part(
        b_x: @x_origin,
        b_y: 0.to_b,
        b_z: @z_origin,
        part: Brick1X3X.new,
      )
      add_part(
        b_x: @x_origin + 1.to_b,
        b_y: 1.to_b,
        b_z: @z_origin,
        part: Brick1X3X.new,
      )
    end
  end

  def create_basement_north_west
    if west_filled?
      if north_west_filled?
        add_part(
          b_x: @x_origin + 9.to_b,
          b_y: 0.to_b,
          b_z: @z_origin,
          part: Brick1X3X.new,
        )
        add_part(
          b_x: @x_origin + 8.to_b,
          b_y: 1.to_b,
          b_z: @z_origin,
          part: Brick1X4X.new,
        )
      else
        add_part(
          b_x: @x_origin + 9.to_b,
          b_y: 0.to_b,
          b_z: @z_origin,
          part: ArchX.new,
        )
        add_part(
          b_x: @x_origin + 8.to_b,
          b_y: 1.to_b,
          b_z: @z_origin,
          part: Brick1X2X.new,
        )
        add_part(
          b_x: @x_origin + 14.to_b,
          b_y: 1.to_b,
          b_z: @z_origin,
          part: Brick1X2X.new,
        )
      end
    else
      add_part(
        b_x: @x_origin + 9.to_b,
        b_y: 0.to_b,
        b_z: @z_origin,
        part: Brick1X3X.new,
      )
      add_part(
        b_x: @x_origin + 8.to_b,
        b_y: 1.to_b,
        b_z: @z_origin,
        part: Brick1X3X.new,
      )
    end
  end

  def create_basement_south_east
    if east_filled?
      if south_east_filled?
        add_part(
          b_x: @x_origin,
          b_y: 0.to_b,
          b_z: @z_origin + 11.to_b,
          part: Brick1X3X.new,
        )
        add_part(
          b_x: @x_origin,
          b_y: 1.to_b,
          b_z: @z_origin + 11.to_b,
          part: Brick1X4X.new,
        )
      end
    else
      add_part(
        b_x: @x_origin,
        b_y: 0.to_b,
        b_z: @z_origin + 11.to_b,
        part: Brick1X3X.new,
      )
      add_part(
        b_x: @x_origin + 1.to_b,
        b_y: 1.to_b,
        b_z: @z_origin + 11.to_b,
        part: Brick1X3X.new,
      )
    end
  end

  def create_basement_south_west
    if west_filled?
      if south_west_filled?
        add_part(
          b_x: @x_origin + 9.to_b,
          b_y: 0.to_b,
          b_z: @z_origin + 11.to_b,
          part: Brick1X3X.new,
        )
        add_part(
          b_x: @x_origin + 8.to_b,
          b_y: 1.to_b,
          b_z: @z_origin + 11.to_b,
          part: Brick1X4X.new,
        )
      else
        add_part(
          b_x: @x_origin + 9.to_b,
          b_y: 0.to_b,
          b_z: @z_origin + 11.to_b,
          part: ArchX.new,
        )
        add_part(
          b_x: @x_origin + 8.to_b,
          b_y: 1.to_b,
          b_z: @z_origin + 11.to_b,
          part: Brick1X2X.new,
        )
        add_part(
          b_x: @x_origin + 14.to_b,
          b_y: 1.to_b,
          b_z: @z_origin + 11.to_b,
          part: Brick1X2X.new,
        )
      end

    else
      add_part(
        b_x: @x_origin + 9.to_b,
        b_y: 0.to_b,
        b_z: @z_origin + 11.to_b,
        part: Brick1X3X.new,
      )
      add_part(
        b_x: @x_origin + 8.to_b,
        b_y: 1.to_b,
        b_z: @z_origin + 11.to_b,
        part: Brick1X3X.new,
      )
    end
  end

  def create_basement_east
    if east_filled?
    else
      add_part(
        b_x: @x_origin,
        b_y: 0.to_b,
        b_z: @z_origin + 3.to_b,
        part: ArchZ.new,
      )
      create_basement_east_north
      create_basement_east_south
    end
  end

  def create_basement_west
    if west_filled?
    else
      add_part(
        b_x: @x_origin + 11.to_b,
        b_y: 0.to_b,
        b_z: @z_origin + 3.to_b,
        part: ArchZ.new,
      )
      create_basement_west_north
      create_basement_west_south
    end
  end

  def create_basement_west_north
    if north_filled?
      if north_west_filled?
        add_part(
          b_x: @x_origin + 11.to_b,
          b_y: 0.to_b,
          b_z: @z_origin,
          part: Brick1X3Z.new,
        )
        add_part(
          b_x: @x_origin + 11.to_b,
          b_y: 1.to_b,
          b_z: @z_origin,
          part: Brick1X4Z.new,
        )
      end
    else
      add_part(
        b_x: @x_origin + 11.to_b,
        b_y: 0.to_b,
        b_z: @z_origin + 1.to_b,
        part: Brick1X2Z.new,
      )
      add_part(
        b_x: @x_origin + 11.to_b,
        b_y: 1.to_b,
        b_z: @z_origin,
        part: Brick1X4Z.new,
      )
    end
  end

  def create_basement_west_south
    if south_filled?
      if south_west_filled?
        add_part(
          b_x: @x_origin + 11.to_b,
          b_y: 0.to_b,
          b_z: @z_origin + 9.to_b,
          part: Brick1X3Z.new,
        )
        add_part(
          b_x: @x_origin + 11.to_b,
          b_y: 1.to_b,
          b_z: @z_origin + 8.to_b,
          part: Brick1X4Z.new,
        )
      else
        add_part(
          b_x: @x_origin + 11.to_b,
          b_y: 0.to_b,
          b_z: @z_origin + 9.to_b,
          part: ArchZ.new,
        )
        add_part(
          b_x: @x_origin + 11.to_b,
          b_y: 1.to_b,
          b_z: @z_origin + 8.to_b,
          part: Brick1X2Z.new,
        )
        add_part(
          b_x: @x_origin + 11.to_b,
          b_y: 1.to_b,
          b_z: @z_origin + 14.to_b,
          part: Brick1X2Z.new,
        )
      end
    else
      add_part(
        b_x: @x_origin + 11.to_b,
        b_y: 0.to_b,
        b_z: @z_origin + 9.to_b,
        part: Brick1X2Z.new,
      )
      add_part(
        b_x: @x_origin + 11.to_b,
        b_y: 1.to_b,
        b_z: @z_origin + 8.to_b,
        part: Brick1X4Z.new,
      )
    end
  end
end
