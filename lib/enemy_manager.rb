require 'gosu'
require './lib/zombie.rb'

class EnemyManager

  NORTH = 1
  EAST  = 2
  SOUTH = 3
  WEST  = 4

  XY_DELTA = {
    NORTH => { x:  0, y:  -1, rotation: 180},
    EAST  => { x:  1, y:   0, rotation: 270},
    SOUTH => { x:  0, y:   1, rotation: 0},
    WEST  => { x: -1, y:   0, rotation: 90}
  }

  def initialize(window)
    @window = window
    @enemies = []
    @enemies << Zombie.new(self, window, 64 * window.game_manager.map.scale_x * 1.5, 64 * window.game_manager.map.scale_y * 1.5, EAST, window.game_manager.map.scale_x, window.game_manager.map.scale_x)
  end

  def draw
    @enemies.each { |enemy| enemy.draw }
  end

  def update
    @enemies.each { |enemy| enemy.update }
  end

  def zombie_tiles
    @zombie_tiles ||= Gosu::Image.load_tiles(@window, './images/zombie.png', 64, 64, true)
  end

end
