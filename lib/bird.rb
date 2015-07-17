require 'gosu'

class Bird

  STEP_SPEED = 16

  def initialize(window, x, y, scale_x, scale_y, tiles)
    @window, @x, @y = window, x, y
    @scale_x, @scale_y, @tiles = scale_x, scale_y, tiles
    @step = 0
    @step_change = STEP_SPEED
  end

  def draw
    @tiles[@step].draw_rot(@x, @y, 0, 0, 0.5, 0.5, @scale_x, @scale_y)
    font.draw(@step, @x + 40, @y, 1.0, 1.0, 1.0)
  end

  def update
    @step_change += 1
    if @step_change >= STEP_SPEED
      @step_change = 0
      @step += 1
      if @step >= @tiles.size
        @step = 0
      end
    end
  end

  def font
    @font ||= Gosu::Font.new(@window, "Arial", 18)
  end
end
