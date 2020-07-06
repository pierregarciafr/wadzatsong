class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user

    @faster_answer = Answer.where(status:true).order(answering_time: :ASC).first
    @user_faster_answer = @user.answers.where(status:true).order(answering_time: :ASC).first
  end

  private

  def get_highscore(user)
    highscore = []
    if user.games.count != 0
      highscore << user.games.order(total_score: :desc).first.total_score
    end
    if user.participations.count !=0
      highscore << user.participations.order(total_score: :desc).first.total_score
    end
    highscore.sort.last
  end
end
