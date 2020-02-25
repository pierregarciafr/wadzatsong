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

  def show
    @game = Game.last
    @answer = Answer.new
    @answers = @game.answers
  end

  def new
    @game = Game.new()
  end

  def edit
    @game = Game.find(params[:id])
    @playlists = Playlist.all
    authorize @game
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def show
    @game = Game.last
    @answer = Answer.new
    @answers = @game.answers
  end

  private

  def game_params
  params.require(:game).permit(:status, :playlist_id)
  end
end
