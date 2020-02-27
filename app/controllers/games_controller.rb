class GamesController < ApplicationController

  def create
    # @game = policy_scope(Game.find(params[:id]))
    Answer.destroy_all
    @game = Game.new(user: current_user)
    authorize @game
    @game.status = :created
    @game.save
    redirect_to edit_game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
    authorize @game
    @answer = Answer.new
    @participation = Participation.new
    @user = current_user
    @playlist = @game.playlist
    @answers = @game.answers
    @current_track = @game.playlist.tracks.where.not(id: @answers.where(status: true).pluck(:track_id)).first

     authorize @game
     if @current_track
      if @current_track.answers.empty?
        @answering_time = 0
      else
        @answering_time = @current_track.answers.last.answering_time
      end

    end

  end

  def paused
    @game = Game.find(params[:id])
    authorize @game
    @game.paused!
    redirect_to game_path(@game, current_time: params[:current_time])
  end

  def created
    @game = Game.find(params[:id])
  end

  def ready
    @game = Game.find(params[:id])
    @participation = Participation.where(game_id: params[:id]).last
    @game.ready!
    redirect_to game_path(@game)
  end

  def running
    @game = Game.find(params[:id])
    @game.running!
    redirect_to game_path(@game)
    authorize @game
  end

  def new
    @game = Game.new(user: current_user) if current_user
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
