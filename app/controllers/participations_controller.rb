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
    @game = Game.find_by(token: token)
    @participation.game = @game
    if @participation.save
        redirect_to participation_path(@participation)
    else
      render :new
    end
    # @game.ready!
  end

  def show
    @participation = Participation.find(params[:id])
    authorize @participation
  end

  def edit
     # @participation = Participation.find(params[:id])
  end

  private

  def participation_params
    params.require(:participation).permit(:token, :user, :game)
  end

end
