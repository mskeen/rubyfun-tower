require './lib/map.rb'
require './lib/enemy_manager.rb'
require './lib/hero_manager.rb'

class GameManager
  def initialize(window)
    @window = window
  end

  def draw
    map.draw
    enemy_manager.draw
    hero_manager.draw
  end

  def update
    # map.update
    enemy_manager.update
    hero_manager.update
  end

  def map
    @map ||= Map.new(@window)
  end

  def enemy_manager
    @enemy_manager ||= EnemyManager.new(@window)
  end

  def hero_manager
    @hero_manager ||= HeroManager.new(@window)
  end
end
