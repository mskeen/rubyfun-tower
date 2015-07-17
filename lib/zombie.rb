require 'gosu'

class Zombie

  SPEED = 1.2
  STEP_COUNT = 4
  STEP_SPEED = 16

  def initialize(enemy_manager, window, x, y, direction, scale_x, scale_y)
    @enemy_manager, @window = enemy_manager, window
    @x, @y, @direction = x, y, direction
    @scale_x, @scale_y = scale_x, scale_y
    @step = 0
    @step_change = STEP_SPEED
  end

  def draw
    @enemy_manager.zombie_tiles[@step].draw_rot(@x, @y, 0, EnemyManager::XY_DELTA[@direction][:rotation], 0.5, 0.5, @scale_x, @scale_y)
  end

  def update
    movement = EnemyManager::XY_DELTA[@direction]
    @x += movement[:x] * SPEED
    @y += movement[:y] * SPEED
    @step_change += 1
    if @step_change >= STEP_SPEED
      @step_change = 0
      @step += 1
      if @step >= STEP_COUNT
        @step = 0
      end
    end
  end
end
