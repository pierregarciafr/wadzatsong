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
    @answer.status = check_answer(@answer, @track) # modif --- call of check_answer
    # @answer.save # modif

      # if (@answer.content.downcase == @track.title.downcase) || (@answer.content.downcase == @track.artist.downcase)
      #   @answer.status = true

      # else
      #   @answer.status = false
      #   @answer.save
      # end

    # @game.running! # --- modif

    # chatroom ----

    if @answer.save     # if answersave
      GameChannel.broadcast_to(@game, render_to_string(partial: 'answer', locals: { message: @answer}))
      redirect_to game_path(@game)
    else
      render "games/show"
    end

    # ----- fin chatroom
    @game.running!
    redirect_to game_path(@game)
    authorize @game

  end

  private

  def check_answer(answer, track)
    if (@answer.content.downcase == @track.title.downcase) || (@answer.content.downcase == @track.artist.downcase)
      @answer.status = true
      @answer.save
    else
      @answer.status = false
      @answer.save
    end
  end

  def params_answer
    params.require(:answer).permit(:content, :answering_time)
  end
end
