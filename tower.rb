require 'gosu'
require './lib/game_manager.rb'

class GameWindow < Gosu::Window

  def initialize
    super(960, 640, false)
    self.caption = 'Tower Defence'
  end

  def draw
    game_manager.draw
  end

  def update
    game_manager.update
  end

  def game_manager
    @game_manager ||= GameManager.new(self)
  end

end

begin
  window = GameWindow.new
  window.show
end
