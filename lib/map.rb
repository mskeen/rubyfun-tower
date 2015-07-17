require 'gosu'

class Map
  WINDOW_WIDTH = 640
  WINDOW_HEIGHT = 640
  SPRITE_SIZE = 64

  def initialize(window)
    @window = window
    set_level(1)
    @road_tiles = Gosu::Image.load_tiles(window, './images/road.png', 64, 64, true)
  end

  def set_level(level)
    @level = level
    @grid = []
    File.open(level_filename(level), "r") do |infile|
      while (line = infile.gets)
        @grid << line.split(//)
      end
    end
    @scale_x = (WINDOW_WIDTH.to_f / @grid[0].size) / SPRITE_SIZE
    @scale_y = (WINDOW_WIDTH.to_f / @grid.size) / SPRITE_SIZE
  end

  def draw
    @grid.each_with_index do |row, y|
      row.each_with_index do |col, x|
        @road_tiles[col.to_i].draw(x * 64 * scale_x, y * 64 * scale_y, 0, scale_x, scale_y)
      end
    end
  end

  def scale_x
    @scale_x
  end

  def scale_y
    @scale_y
  end

  private

  def level_filename(level)
    "./lib/levels/%03d.txt" % level
  end

end
