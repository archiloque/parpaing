class SlopeInverted452X2DoubleConvexNorthWest < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_INVERTED_45_2_2_DOUBLE_CONVEX,
        color: color,
        orientation: PartOrientation::O_0,
        x: x,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class SlopeInverted452X2DoubleConvexNorthEast < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_INVERTED_45_2_2_DOUBLE_CONVEX,
        color: color,
        orientation: PartOrientation::O_270,
        x: x,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class SlopeInverted452X2DoubleConvexSouthEast < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_INVERTED_45_2_2_DOUBLE_CONVEX,
        color: color,
        orientation: PartOrientation::O_180,
        x: x,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end

class SlopeInverted452X2DoubleConvexSouthWest < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_INVERTED_45_2_2_DOUBLE_CONVEX,
        color: color,
        orientation: PartOrientation::O_90,
        x: x,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end
