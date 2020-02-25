class GamesController < ApplicationController

authorize @game

  def show
    @game = Game.last
    @answer = Answer.new
    @answers = @game.answers
  end
  
  def new
    @game = Game.new()
  end

  def create
    @game = policy_scope(Game.find(params[:id]))
    @game = Game.new(games_params)
    @game.user = current_user
    if @game.save
      redirect_to edit_game_path(@game)
    else
      render :new
    end
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
