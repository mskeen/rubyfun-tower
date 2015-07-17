require 'gosu'
require './lib/bird.rb'

class HeroManager

  def initialize(window)
    @window = window
    @heroes = []
    scale_x, scale_y = window.game_manager.map.scale
    @heroes << Bird.new(window, 96 * scale_x, 160 * scale_y, scale_x, scale_x, red_bird_tiles)
    @heroes << Bird.new(window, 96 * scale_x, 224 * scale_y, scale_x, scale_x, yellow_bird_tiles)
    @heroes << Bird.new(window, 96 * scale_x, 288 * scale_y, scale_x, scale_x, black_bird_tiles)
  end

  def draw
    @heroes.each { |hero| hero.draw }
  end

  def update
    @heroes.each { |hero| hero.update }
  end

  def red_bird_tiles
    @red_bird_tiles ||= Gosu::Image.load_tiles(@window, './images/red_bird.png', 64, 64, true)
  end

  def yellow_bird_tiles
    @yellow_bird_tiles ||= Gosu::Image.load_tiles(@window, './images/yellow_bird.png', 64, 64, true)
  end

  def black_bird_tiles
    @black_bird_tiles ||= Gosu::Image.load_tiles(@window, './images/black_bird.png', 64, 64, true)
  end

end
