# Test Full
class SpriteSheet
  attr_sprite

  attr_accessor :tiles, :full_w, :full_h, :frames

  # Animation Details
  attr_accessor :start

  def initialize
    @full_w = 3483
    @full_h = 2709
    @w = 387
    @h = 387
    @path = 'sprites/pop.png'
    @tiles = {}
    @frames = 60
    @start = $tick
    build_tiles
    @tile_w = w
    @tile_h = h

    @x = rand(1280 + w) - h
    @y = rand(720 + h) - w
  end

  def index
    start.frame_index frames, 1, true, $tick
  end

  def tile_x
    tiles[index][:tile_x]
  end

  def tile_y
    tiles[index][:tile_y]
  end

  # Helper to calculate only once
  def build_tiles
    frames.times do |idx|
      tiles[idx] = {
        tile_x: (idx * w) % full_w,
        tile_y: h * (idx * w / full_w).floor
      }
    end
  end
end
