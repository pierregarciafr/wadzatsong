class ParticipationsController < ApplicationController

  def index
    @participations = Participation.all
  end

  def new
    @participation = Participation.new()
    authorize @participation
  end

  def create
    @participation = Participation.new(participation_params)
    authorize @participation
    @participation.user = current_user
    token = @participation.token
    @participation.game = Game.find_by(token: token)
    @participation.save
    # @game.ready!
    redirect_to game_path(@participation.game)
  end

  def edit
     # @participation = Participation.find(params[:id])
  end


  private

  def participation_params
    params.require(:participation).permit(:token, :user, :game)
  end

end
