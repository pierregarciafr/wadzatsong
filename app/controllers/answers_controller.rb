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
    
    check_answer(@answer, @track)

    if @answer.save    
      GameChannel.broadcast_to(@game, @answer)
      @game.running!
      redirect_to game_path(@game)
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
