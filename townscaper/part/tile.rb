class Tile1X1 < SetPart
  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: Part.new('Tile 1 x 1 with Groove', '3070b'),
        color: color,
        orientation: PartOrientation::O_0,
        x: x,
        y: y - 12.to_u,
        z: z,
        ),
    ]
  end
end
