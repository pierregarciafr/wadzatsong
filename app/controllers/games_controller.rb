class GamesController < ApplicationController

  def create
    # @game = policy_scope(Game.find(params[:id]))
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
    @participation = Participation.find_by(token: @game.token)
    @user = @game.user # MJ
    # @partipants = @game.participants # player 2
    @playlist = @game.playlist
    @answers = @game.answers
    # test pour passage à la prochaine track
    @current_track = @game.playlist.tracks.where.not(id: @answers.where(status: true).pluck(:track_id)).first
    authorize @game
    if @current_track
      if @current_track.answers.empty? || @current_track.answers.last.status == true
        @answering_time = 0
      else
        @answering_time = @current_track.answers.last.answering_time
      end
    end

  end

  def created
    @game = Game.find(params[:id])
    @main_user = @game.user
  end

  def running
    @game = Game.find(params[:id])
    @answer = Answer.new
    @user = current_user
    @game.running!
    @playlist = @game.playlist
    if @game.participants.any?
      @answers = @game.answers
      @current_track = @game.playlist.tracks.where.not(id: @answers.where(status: true).pluck(:track_id)).first
      if @current_track.answers.empty? || @current_track.answers.last.status == true
        @answering_time = 0
      else
        @answering_time = @current_track.answers.last.answering_time
      end

      GameChannel.broadcast_to(
      @game,
      status: 'running',
      content: render_to_string(
        partial: "game_running",
        locals: {
          answering_time: @answering_time,
          current_track: @current_track,
          game: @game,
          answer: @answer
        }),
      navbar: render_to_string(
        partial: "navbar",
        locals: {
            user: @user,
            game_participants: @game_participants,
            playlist: @playlist
        })
      )

    end
    redirect_to game_path(@game)
    authorize @game
  end

  def paused
    @game = Game.find(params[:id])
    @answer = Answer.new()
    authorize @game
    @game.paused!
    # ajouté par Pierre pour broadcaster des valeurs !nil
    if @game.participants.any?
      @answers = @game.answers

      @current_track = @game.playlist.tracks.where.not(id: @answers.where(status: true).pluck(:track_id)).first
      if @current_track.answers.empty? || @current_track.answers.last.status == true
        @answering_time = 0
      else
        @answering_time = @current_track.answers.last.answering_time
      end
      GameChannel.broadcast_to(
        @game,
        status: 'paused',
        content: render_to_string(
          partial: "game_wait",
          locals: {
        current_track: @current_track,
        game: @game,
        answer: @answer,
        user: current_user
          }
          ),
        user: current_user
        )
    end
    redirect_to game_path(@game, current_time: params[:current_time])
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

    if @game.playlist.name == "Classic Rock"
      RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
      # classicRock = RSpotify::Playlist.search('classic rock').first.tracks(limit:10)
     classicRock = RSpotify::Recommendations.generate(limit: 100, seed_genres: ["rock"]).tracks
     classic_rock_playlist = []
     classicRock.each do |track|
       if track.popularity > 65 && track.preview_url
         classic_rock_playlist << track
       end
     end
     new_playlist = Playlist.create(name:"Classic Rock", picture:'classicrock.jpg')
     classic_rock_playlist.first(5).each do |track|
      puts track.name
      new_track = Track.create(title: "#{track.name}", artist: "#{track.artists[0].name}", url_preview: "#{track.preview_url}")
      new_track.playlist_id = new_playlist.id
      new_track.save
     end
     @game.playlist = new_playlist
    end

    if @game.playlist_id != nil
        @game.save
        authorize @game
        redirect_to game_path(@game)
    else
        authorize @game
        redirect_to edit_game_path(@game)
    end

  end

  private


  def game_params
    params.require(:game).permit(:status, :playlist_id)
  end

end
