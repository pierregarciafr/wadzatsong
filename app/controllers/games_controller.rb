class GamesController < ApplicationController

  def create
    # @game = policy_scope(Game.find(params[:id]))
    @game = Game.new
    authorize @game
    @game.user = current_user
    @game.status = :created
    @game.save!
    redirect_to edit_game_path(@game)
  end

  def edit
    @game = Game.find(params[:id])
    @playlists = Playlist.all
    authorize @game
  end

  private

  def game_params
    params.require(:game).permit(:status)
  end
end
