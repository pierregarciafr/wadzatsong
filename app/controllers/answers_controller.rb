class AnswersController < ApplicationController
  def create
    @track = Track.find(params[:answer][:track])
    @game = Game.find(params[:game_id])
    @answer = Answer.new(params_answer)
    @answer.game = @game
    @answer.user = current_user
    @answer.track = @track
    @answer.save # remplacer par answersave = @answer.save ?
    @tracks = @game.playlist.tracks
    @user = current_user
    @playlist = @game.playlist
    check_answer(@answer, @track)

    if @answer.save
      # GameChannel.broadcast_to(@game, @answer)
      @game.running!
      # l'id de la premiere des tracks qui n'a pas encore été jouée
      @current_track = @game.playlist.tracks.where.not(id: @game.answers.where(status: true).pluck(:track_id)).first
      if @current_track
              GameChannel.broadcast_to(
      @game,
      status: 'running',
      content: render_to_string(
        partial: "games/game_running",
        locals: {
          answering_time: @answering_time,
          current_track: @current_track,
          game: @game
        }),
      navbar: render_to_string(
        partial: "games/navbar",
        locals: {
            user: @user,
            game_participants: @game_participants,
            playlist: @playlist
        })
      )
        redirect_to game_path(@game)
        # <%= link_to running_game_path(@game), method: :patch do %>
      else
        @game.finished!
        GameChannel.broadcast_to(
        @game,
        status: 'finished',
        content: render_to_string(
          partial: "games/game_finished",
          locals: {
            answering_time: @answering_time,
            current_track: @current_track,
            game: @game
          })
        )
        redirect_to game_path(@game)
      end

    else
      render "games/show"
    end

    # redirect_to game_path(@game)
    authorize @game

  end

  private

  def check_answer(answer, track)
     if (String::Similarity.cosine @answer.content.downcase, @track.title.downcase) >= 0.8 || (String::Similarity.cosine @answer.content.downcase, @track.artist.downcase) >= 0.8
     answer.status = true
    else
      answer.status = false
    end
  end

  def params_answer
    params.require(:answer).permit(:content, :answering_time)
  end

  #   def create # remise en état rapide
  #   @track = Track.find(params[:answer][:track])
  #   @game = Game.find(params[:game_id])
  #   @answer = Answer.new(params_answer)
  #   @answer.game = @game
  #   @answer.user = current_user
  #   @answer.track = @track
  #   @answer.save # remplacer par answersave = @answer.save ?
  #   @tracks = @game.playlist.tracks
  #   # @answer.status = check_answer(@answer, @track) # modif --- call of check_answer
  #   # @answer.save # modif

  #   if (@answer.content.downcase == @track.title.downcase) || (@answer.content.downcase == @track.artist.downcase)
  #     @answer.status = true
  #     @answer.save
  #   else
  #     @answer.status = false
  #     @answer.save
  #   end
  #   @game.running! # --- modif

  #   redirect_to game_path(@game)
  #   authorize @game

  # end
end
