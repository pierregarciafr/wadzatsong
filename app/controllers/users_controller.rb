class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @faster_answer = Answer.where(status:true).order(answering_time: :ASC).first
    @user_faster_answer = @user.answers.where(status:true).order(answering_time: :ASC).first
    @total_good_answers = @user.answers.where(status: true).count
    total_tracks = get_total_tracks(@user)
    @pourcent_user_good_answers = (@total_good_answers * 100) / total_tracks
  end

  private

  def get_total_tracks(user)
    total_tracks = 0
    user.games.each do |game|
      game.playlist.tracks.count
      total_tracks += game.playlist.tracks.count
    end
    return total_tracks
  end



end
