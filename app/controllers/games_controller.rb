class GamesController < ApplicationController

  def create
    # @game = policy_scope(Game.find(params[:id]))
    @game = Game.new(user: current_user)
    authorize @game
    @game.status = :created
    @game.save!
    redirect_to edit_game_path(@game)
  end

  def show
    # !!! 2 show !!!
    # case @game.status
    # game.started
    #  when 0

    #@game = Game.find(params[:id])
    @game = Game.find(params[:id])
    @answer = Answer.new
    @playlist = @game.playlist
    @answers = @game.answers
    @current_track = @game.playlist.tracks.where.not(id: @answers.where(status: true).pluck(:track_id)).first
    authorize @game
  end

  def new
    @game = Game.new(user: current_user)
  end

  def edit
    @game = Game.find(params[:id])
    @playlists = Playlist.all
    authorize @game
  end

  def update
    @game = Game.find(params[:id])
    @game.playlist_id = params[:playlist_id]
    @game.save
    authorize @game
    redirect_to game_path(@game)
  end

  private

  def game_params
    params.require(:game).permit(:status, :playlist_id)
  end

end
