class Mailbox < SetPart
  PLATE_ROUND = Part.new('Plate Round 2 x 2 with Axle Hole Type 1', '4032a')
  MAILBOX_BOX = Part.new('Box 2 x 2 x 2', '4345b')
  MAILBOX_DOOR = Part.new('Box 2 x 2 x 2 Door with Slot', '4346')
  MAILBOX_TOP = Part.new('Brick Curved 2 x 2 with Two Top Studs', '30165')

  # @param [PartOrientation] orientation
  def initialize(orientation)
    super(
      x: 2,
      y: 2,
      z: 2,)
    @orientation = orientation
  end

  def create(color:, x:, y:, z:)
    x_pos = ((x - 0.5) * BRICK_WIDTH)
    z_pos = ((z - 0.5) * BRICK_WIDTH)
    [
      Emitter.emit(
        part: PLATE_ROUND,
        color: color,
        orientation: @orientation,
        y: -12,
        x: x_pos,
        z: z_pos,
      ),
      Emitter.emit(
        part: PLATE_ROUND,
        color: color,
        orientation: @orientation,
        x: x_pos,
        y: -20,
        z: z_pos,
      ),
      Emitter.emit(
        part: MAILBOX_BOX,
        color: color,
        orientation: @orientation,
        x: x_pos,
        y: (y * BRICK_HEIGHT) - 68,
        z: z_pos,
      ),
      Emitter.emit(
        part: MAILBOX_DOOR,
        color: color,
        orientation: @orientation,
        x: x_pos,
        y: (y * BRICK_HEIGHT) - 68,
        z: z_pos,
      ),
      Emitter.emit(
        part: MAILBOX_TOP,
        color: color,
        orientation: @orientation,
        x: x_pos,
        y: (y * BRICK_HEIGHT) - 92,
        z: z_pos,
      ),]
  end
end

class MailboxLeft < Mailbox
  def initialize()
    super(PartOrientation::Z_270)
  end
end

class MailboxRight < Mailbox
  def initialize()
    super(PartOrientation::Z_90)
  end
end