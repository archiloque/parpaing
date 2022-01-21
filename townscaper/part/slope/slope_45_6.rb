class Slope452X6North < SetPart

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2X6,
        color: color,
        orientation: PartOrientation::O_0,
        x: x + 50.to_u,
        y: y - 28.to_u,
        z: z + 20.to_u,
      ),
    ]
  end
end

class Slope452X6South < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Slope45::SLOPE_45_2X6,
        color: color,
        orientation: PartOrientation::O_180,
        x: x + 50.to_u,
        y: y - 28.to_u,
        z: z,
      ),
    ]
  end
end
