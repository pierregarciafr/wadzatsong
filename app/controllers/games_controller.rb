class GamesController < ApplicationController

  # def new
  #   @game = Game.new()
  # end

  # def create
  #   # @game = policy_scope(Game.find(params[:id]))
  #   @game = Game.new(games_params)
  #   @game.user = current_user
  #   if @game.save
  #     redirect_to edit_game_path(@game)
  #   else
  #     render :new
  #   end
  # end

  def edit
    @game = Game.find(params[:id])
    @playlists = Playlist.all
  end
end
