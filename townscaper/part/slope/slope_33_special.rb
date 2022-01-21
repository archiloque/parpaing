class Slope333X3ConvexNorthEast < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_3_DOUBLE_CONVEX,
        color: color,
        orientation: PartOrientation::O_270,
        x: x + 40.to_u,
        y: y - 28.to_u,
        z: z + 40.to_u,
      ),
    ]
  end
end

class Slope333X3ConvexNorthWest < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_3_DOUBLE_CONVEX,
        color: color,
        orientation: PartOrientation::O_0,
        x: x,
        y: y - 28.to_u,
        z: z + 40.to_u,
      ),
    ]
  end
end

class Slope333X3ConvexSouthEast < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_3_DOUBLE_CONVEX,
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 40.to_u,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class Slope333X3ConvexSouthWest < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_3_DOUBLE_CONVEX,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: y - 28.to_u,
        z: z,
        ),
    ]
  end
end

class Slope333X3ConcaveNorthWest < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_3_DOUBLE_CONCAVE,
        color: color,
        orientation: PartOrientation::O_0,
        x: x,
        y: y - 28.to_u,
        z: z + 40.to_u,
      ),
    ]
  end
end

class Slope333X3ConcaveNorthEast < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_3_DOUBLE_CONCAVE,
        color: color,
        orientation: PartOrientation::O_270,
        x: x + 40.to_u,
        y: y - 28.to_u,
        z: z + 40.to_u,
      ),
    ]
  end
end

class Slope333X3ConcaveSouthWest < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_3_DOUBLE_CONCAVE,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class Slope333X3ConcaveSouthEast < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_3_DOUBLE_CONCAVE,
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 40.to_u,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end
