class GamesController < ApplicationController

  def show
    @game = Game.last
    @answer = Answer.new
    @answers = @game.answers
    @current_track = @game.playlist.tracks.where.not(id: @answers.where(status: true).pluck(:track_id)).first
    authorize @game
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



  end


end
