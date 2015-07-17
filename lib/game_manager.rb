require './lib/map.rb'
require './lib/enemy_manager.rb'

class GameManager
  def initialize(window)
    @window = window
  end

  def draw
    map.draw
    enemy_manager.draw
  end

  def update
    # map.update
    enemy_manager.update
  end

  def map
    @map ||= Map.new(@window)
  end

  def enemy_manager
    @enemy_manager ||= EnemyManager.new(@window)
  end
end
