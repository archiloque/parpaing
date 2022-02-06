class Tile1X1 < SetPart
  TILE_1X1 = Part.new('Tile 1 x 1 with Groove', '3070b')

  def create(color:, x:, y:, z:)
    [
      Emitter.emit(
        part: TILE_1X1,
        color: color,
        orientation: PartOrientation::O_0,
        x: x,
        y: y - 12.to_u,
        z: z,
      ),
    ]
  end
end
