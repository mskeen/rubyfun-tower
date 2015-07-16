require './lib/map.rb'

class GameManager
  def initialize(window)
    @window = window
  end

  def draw
    map.draw
  end

  def update
    # map.update
  end

  def map
    @map ||= Map.new(@window)
  end
end
