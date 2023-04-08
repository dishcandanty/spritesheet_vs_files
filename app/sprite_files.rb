# Using Individual Files
class SpriteFiles
  attr_sprite

  attr_accessor :root_path, :frames

  # Animation Details
  attr_accessor :start

  def initialize
    @w = 387
    @h = 387
    @frames = 60
    @start = $tick
    @x = rand(1280 + w) - h
    @y = rand(720 + h) - w
  end

  def path
    "sprites/pop/#{index.to_s.rjust(4, '0')}.png"
  end

  def index
    start.frame_index frames, 1, true, $tick
  end
end
