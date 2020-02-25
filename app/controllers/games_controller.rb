class GamesController < ApplicationController
  def show
    @game = Game.last
    @answer = Answer.new
    @answers = @game.answers
  end
end
