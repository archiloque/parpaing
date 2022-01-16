module CellBasement

  def create_basement
    common = {
      m_y: @y_origin + (1.to_b * Measures::BRICK_HEIGHT),
      color: Color::YELLOW
    }
    create_basement_north(common)
    create_basement_south(common)
    create_basement_west(common)
    create_basement_east(common)
  end

  def create_basement_east_north(common)
    if north_filled?
      if north_east_filled?
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 0.to_b,
            b_z: @z_origin,
            part: Brick1X3Z.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 1.to_b,
            b_z: @z_origin,
            part: Brick1X4Z.new,
          )
        )
      end
    else
      add_part(
        **common.merge(
          b_x: @x_origin,
          b_y: 0.to_b,
          b_z: @z_origin + 1.to_b,
          part: Brick1X2Z.new,
        )
      )
      add_part(
        **common.merge(
          b_x: @x_origin,
          b_y: 1.to_b,
          b_z: @z_origin,
          part: Brick1X4Z.new,
        )
      )
    end
  end

  def create_basement_east_south(common)
    if south_filled?
      if south_east_filled?
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 0.to_b,
            b_z: @z_origin + 8.to_b,
            part: Brick1X4Z.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 1.to_b,
            b_z: @z_origin + 8.to_b,
            part: Brick1X4Z.new,
          )
        )
      else
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 0.to_b,
            b_z: @z_origin + 9.to_b,
            part: ArchZ.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 1.to_b,
            b_z: @z_origin + 8.to_b,
            part: Brick1X2Z.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 1.to_b,
            b_z: @z_origin + 14.to_b,
            part: Brick1X2Z.new,
          )
        )
      end
    else
      add_part(
        **common.merge(
          b_x: @x_origin,
          b_y: 0.to_b,
          b_z: @z_origin + 9.to_b,
          part: Brick1X2Z.new,
        )
      )
      add_part(
        **common.merge(
          b_x: @x_origin,
          b_y: 1.to_b,
          b_z: @z_origin + 8.to_b,
          part: Brick1X4Z.new,
        )
      )
    end
  end

  private

  def create_basement_north(common)
    if north_filled?
    else
      add_part(
        **common.merge(
          b_x: @x_origin + 3.to_b,
          b_y: 0.to_b,
          b_z: @z_origin,
          part: ArchX.new,
        )
      )
      create_basement_north_east(common)
      create_basement_north_west(common)
    end
  end

  def create_basement_south(common)
    if south_filled?
    else
      add_part(
        **common.merge(
          b_x: @x_origin + 3.to_b,
          b_y: 0.to_b,
          b_z: @z_origin + 11.to_b,
          part: ArchX.new,
        )
      )
      create_basement_south_east(common)
      create_basement_south_west(common)
    end
  end

  def create_basement_north_east(common)
    if east_filled?
      if north_east_filled?
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 0.to_b,
            b_z: @z_origin,
            part: Brick1X3X.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 1.to_b,
            b_z: @z_origin,
            part: Brick1X4X.new,
          )
        )
      end
    else
      add_part(
        **common.merge(
          b_x: @x_origin,
          b_y: 0.to_b,
          b_z: @z_origin,
          part: Brick1X3X.new,
        )
      )
      add_part(
        **common.merge(
          b_x: @x_origin + 1.to_b,
          b_y: 1.to_b,
          b_z: @z_origin,
          part: Brick1X3X.new,
        )
      )
    end
  end

  def create_basement_north_west(common)
    if west_filled?
      if north_west_filled?
        add_part(
          **common.merge(
            b_x: @x_origin + 9.to_b,
            b_y: 0.to_b,
            b_z: @z_origin,
            part: Brick1X3X.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 8.to_b,
            b_y: 1.to_b,
            b_z: @z_origin,
            part: Brick1X4X.new,
          )
        )
      else
        add_part(
          **common.merge(
            b_x: @x_origin + 9.to_b,
            b_y: 0.to_b,
            b_z: @z_origin,
            part: ArchX.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 8.to_b,
            b_y: 1.to_b,
            b_z: @z_origin,
            part: Brick1X2X.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 14.to_b,
            b_y: 1.to_b,
            b_z: @z_origin,
            part: Brick1X2X.new,
          )
        )
      end
    else
      add_part(
        **common.merge(
          b_x: @x_origin + 9.to_b,
          b_y: 0.to_b,
          b_z: @z_origin,
          part: Brick1X3X.new,
        )
      )
      add_part(
        **common.merge(
          b_x: @x_origin + 8.to_b,
          b_y: 1.to_b,
          b_z: @z_origin,
          part: Brick1X3X.new,
        )
      )
    end
  end

  def create_basement_south_east(common)
    if east_filled?
      if south_east_filled?
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 0.to_b,
            b_z: @z_origin + 11.to_b,
            part: Brick1X3X.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin,
            b_y: 1.to_b,
            b_z: @z_origin + 11.to_b,
            part: Brick1X4X.new,
          )
        )
      end
    else
      add_part(
        **common.merge(
          b_x: @x_origin,
          b_y: 0.to_b,
          b_z: @z_origin + 11.to_b,
          part: Brick1X3X.new,
        )
      )
      add_part(
        **common.merge(
          b_x: @x_origin + 1.to_b,
          b_y: 1.to_b,
          b_z: @z_origin + 11.to_b,
          part: Brick1X3X.new,
        )
      )
    end
  end

  def create_basement_south_west(common)
    if west_filled?
      if south_west_filled?
        add_part(
          **common.merge(
            b_x: @x_origin + 9.to_b,
            b_y: 0.to_b,
            b_z: @z_origin + 11.to_b,
            part: Brick1X3X.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 8.to_b,
            b_y: 1.to_b,
            b_z: @z_origin + 11.to_b,
            part: Brick1X4X.new,
          )
        )
      else
        add_part(
          **common.merge(
            b_x: @x_origin + 9.to_b,
            b_y: 0.to_b,
            b_z: @z_origin + 11.to_b,
            part: ArchX.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 8.to_b,
            b_y: 1.to_b,
            b_z: @z_origin + 11.to_b,
            part: Brick1X2X.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 14.to_b,
            b_y: 1.to_b,
            b_z: @z_origin + 11.to_b,
            part: Brick1X2X.new,
          )
        )
      end

    else
      add_part(
        **common.merge(
          b_x: @x_origin + 9.to_b,
          b_y: 0.to_b,
          b_z: @z_origin + 11.to_b,
          part: Brick1X3X.new,
        )
      )
      add_part(
        **common.merge(
          b_x: @x_origin + 8.to_b,
          b_y: 1.to_b,
          b_z: @z_origin + 11.to_b,
          part: Brick1X3X.new,
        )
      )
    end
  end

  def create_basement_east(common)
    if east_filled?
    else
      add_part(
        **common.merge(
          b_x: @x_origin,
          b_y: 0.to_b,
          b_z: @z_origin + 3.to_b,
          part: ArchZ.new,
        )
      )
      create_basement_east_north(common)
      create_basement_east_south(common)
    end
  end

  def create_basement_west(common)
    if west_filled?
    else
      add_part(
        **common.merge(
          b_x: @x_origin + 11.to_b,
          b_y: 0.to_b,
          b_z: @z_origin + 3.to_b,
          part: ArchZ.new,
        )
      )
      create_basement_west_north(common)
      create_basement_west_south(common)
    end
  end

  def create_basement_west_north(common)
    if north_filled?
      if north_west_filled?
        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 0.to_b,
            b_z: @z_origin,
            part: Brick1X3Z.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 1.to_b,
            b_z: @z_origin,
            part: Brick1X4Z.new,
          )
        )
      end
    else
      add_part(
        **common.merge(
          b_x: @x_origin + 11.to_b,
          b_y: 0.to_b,
          b_z: @z_origin + 1.to_b,
          part: Brick1X2Z.new,
        )
      )
      add_part(
        **common.merge(
          b_x: @x_origin + 11.to_b,
          b_y: 1.to_b,
          b_z: @z_origin,
          part: Brick1X4Z.new,
        )
      )
    end
  end

  def create_basement_west_south(common)
    if south_filled?
      if south_west_filled?
        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 0.to_b,
            b_z: @z_origin + 9.to_b,
            part: Brick1X3Z.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 1.to_b,
            b_z: @z_origin + 8.to_b,
            part: Brick1X4Z.new,
          )
        )
      else
        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 0.to_b,
            b_z: @z_origin + 9.to_b,
            part: ArchZ.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 1.to_b,
            b_z: @z_origin + 8.to_b,
            part: Brick1X2Z.new,
          )
        )
        add_part(
          **common.merge(
            b_x: @x_origin + 11.to_b,
            b_y: 1.to_b,
            b_z: @z_origin + 14.to_b,
            part: Brick1X2Z.new,
          )
        )
      end
    else
      add_part(
        **common.merge(
          b_x: @x_origin + 11.to_b,
          b_y: 0.to_b,
          b_z: @z_origin + 9.to_b,
          part: Brick1X2Z.new,
        )
      )
      add_part(
        **common.merge(
          b_x: @x_origin + 11.to_b,
          b_y: 1.to_b,
          b_z: @z_origin + 8.to_b,
          part: Brick1X4Z.new,
        )
      )
    end
  end
end
