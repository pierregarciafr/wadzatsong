class AnswersController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @answer = Answer.new(params_answer)
    @answer.game = @game
    @answer.user = current_user
    @answer.track = Track.find(params[:answer][:track])
    @answer.save
    redirect_to game_path(@game)
  end

  private

  def params_answer
    params.require(:answer).permit(:content)
  end
end
