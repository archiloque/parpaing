class Windows4Front < Windows2x2Front
  def initialize()
    super(Color::TRANS_CLEAR, GLASS_2x2)
  end
end

class Windows4Back < Windows2x2Back
  def initialize()
    super(Color::TRANS_CLEAR, GLASS_2x2)
  end
end

class Windows4Left < Windows2x2Left
  def initialize()
    super(Color::TRANS_CLEAR, GLASS_2x2)
  end
end

class Windows4Right < Windows2x2Right
  def initialize()
    super(Color::TRANS_CLEAR, GLASS_2x2)
  end
end
