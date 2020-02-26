class ParticipationsController < ApplicationController

  def new
    @participation = Participation.new()
    authorize @participation
  end

  def create
    @participation = Participation.new(participation_params)
    @participation.user = current_user
    token = @participation.token
    @participation.game = Game.find_by(token: token)
    @participation.save!
    authorize @participation
    raise
    redirect_to running_game_path(@participation.game), method: :patch
  end

  def edit
     # @participation = Participation.find(params[:id])
  end


  private

  def participation_params
    params.require(:participation).permit(:token, :user, :game)
  end

end
