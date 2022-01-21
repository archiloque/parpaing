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