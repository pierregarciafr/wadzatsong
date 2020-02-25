class AnswersController < ApplicationController
  def create
    @track = Track.find(params[:answer][:track])
    @game = Game.find(params[:game_id])
    @answer = Answer.new(params_answer)
    @answer.game = @game
    @answer.user = current_user
    @answer.track = @track
    @answer.save
    @tracks = @game.playlist.tracks
      if @answer.content == @track.title
        @answer.status = true
        @answer.save
      end
    redirect_to game_path(@game)
    authorize @game
  end

  private

  def params_answer
    params.require(:answer).permit(:content)
  end
end
