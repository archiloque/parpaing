class Slope333X1North < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_1,
        color: color,
        orientation: PartOrientation::O_0,
        x: x,
        y: y - 28.to_u,
        z: z + 40.to_u,
      ),
    ]
  end
end

class Slope333X1East < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope33::SLOPE_33_3_1,
        color: color,
        orientation: PartOrientation::O_270,
        x: x + 40.to_u,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end
