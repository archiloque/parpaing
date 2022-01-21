class Slope452X4Z < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2X4_DOUBLE,
        color: color,
        orientation: PartOrientation::O_0,
        x: x + 30.to_u,
        y: y - 28.to_u,
        z: z + 10.to_u,
      ),
    ]
  end
end

class Slope452X4X < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2X4_DOUBLE,
        color: color,
        orientation: PartOrientation::O_90,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z + 30.to_u,
      ),
    ]
  end
end

class Slope452X1X < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2X1_DOUBLE,
        color: color,
        orientation: PartOrientation::O_90,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class Slope452X1Z < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2X1_DOUBLE,
        color: color,
        orientation: PartOrientation::O_0,
        x: x,
        y: y - 28.to_u,
        z: z + 10.to_u,
      ),
    ]
  end
end

class Slope452X2ConvexConcaveNorthEast < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_2_DOUBLE_CONVEX_DOUBLE_CONCAVE,
        color: color,
        orientation: PartOrientation::O_270,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z + 10.to_u,
      ),
    ]
  end
end

class Slope452X2ConvexConcaveNorthWest < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_2_DOUBLE_CONVEX_DOUBLE_CONCAVE,
        color: color,
        orientation: PartOrientation::O_0,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z + 10.to_u,
      ),
    ]
  end
end

class Slope452X2ConvexConcaveSouthEast < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_2_DOUBLE_CONVEX_DOUBLE_CONCAVE,
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z + 10.to_u,
        ),
    ]
  end
end

class Slope452X2ConvexConcaveSouthWest < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_2_DOUBLE_CONVEX_DOUBLE_CONCAVE,
        color: color,
        orientation: PartOrientation::O_90,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z + 10.to_u,
        ),
    ]
  end
end

class Slope452X2ConvexNorthEast < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_2_DOUBLE_CONVEX,
        color: color,
        orientation: PartOrientation::O_270,
        x: x + 20.to_u,
        y: y - 28.to_u,
        z: z + 20.to_u,
      ),
    ]
  end
end

class Slope452X2ConvexNorthWest < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_2_DOUBLE_CONVEX,
        color: color,
        orientation: PartOrientation::O_0,
        x: x,
        y: y - 28.to_u,
        z: z + 40.to_u,
      ),
    ]
  end
end

class Slope452X2ConvexSouthEast < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_2_DOUBLE_CONVEX,
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 20.to_u,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class Slope452X2ConvexSouthWest < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_2_DOUBLE_CONVEX,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class Slope452X2ConcaveNorthWest < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_2_DOUBLE_CONCAVE,
        color: color,
        orientation: PartOrientation::O_0,
        x: x,
        y: y - 28.to_u,
        z: z + 20.to_u,
      ),
    ]
  end
end

class Slope452X2ConcaveNorthEast < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_2_DOUBLE_CONCAVE,
        color: color,
        orientation: PartOrientation::O_270,
        x: x + 20.to_u,
        y: y - 28.to_u,
        z: z + 20.to_u,
      ),
    ]
  end
end

class Slope452X2ConcaveSouthWest < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_2_DOUBLE_CONCAVE,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class Slope452X2ConcaveSouthEast < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_2_DOUBLE_CONCAVE,
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 20.to_u,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class Slope452X1DoubleInvertedSouth < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_1_DOUBLE_INVERTED,
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z + 20.to_u,
      ),
    ]
  end
end

class Slope452X1DoubleInvertedNorth < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_1_DOUBLE_INVERTED,
        color: color,
        orientation: PartOrientation::O_0,
        x: x + 10.to_u,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class Slope452X1DoubleInvertedEast < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_1_DOUBLE_INVERTED,
        color: color,
        orientation: PartOrientation::O_270,
        x: x,
        y: y - 28.to_u,
        z: z + 10.to_u,
      ),
    ]
  end
end

class Slope452X1DoubleInvertedWest < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2_1_DOUBLE_INVERTED,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: y - 28.to_u,
        z: z + 10.to_u,
      ),
    ]
  end
end
