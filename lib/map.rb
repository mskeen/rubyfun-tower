require 'gosu'

class Map

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
  end

  def draw
    @grid.each_with_index do |row, y|
      row.each_with_index do |col, x|
        @road_tiles[col.to_i].draw(x*32, y*32, 0, 0.5, 0.5)
      end
    end
  end

  private

  def level_filename(level)
    "./lib/levels/%03d.txt" % level
  end

end
