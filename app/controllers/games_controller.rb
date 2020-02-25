class GamesController < ApplicationController

  def create
    @game = policy_scope(Game.find(params[:id]))
  end

end
