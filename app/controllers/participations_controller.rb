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
    @participation.user = current_user
    token = @participation.token
    @game = Game.find_by(token: token)
    @participation.game = @game
    authorize @participation
    if @participation.save && @game
      GameChannel.broadcast_to(
        @game,
        game: @game,
        status: 'connection',
        token: token,
        participation: @participation.id,
        hostUser: @game.user,
        joinedUser: @game.participants.first
      )
      # redirect_to participation_path(@participation)
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def show
    @participation = Participation.find(params[:id])
    GameChannel.broadcast_to(
      @participation.game,
      status: 'connection',
      participation: @participation.id,
      user: @participation.user.pseudo
    )
    authorize @participation
    if @participation.game.running?
      redirect_to game_path(@participation.game)
    else
      render :show
    end
  end

  def edit
     # @participation = Participation.find(params[:id])
  end

  private

  def participation_params
    params.require(:participation).permit(:token, :user, :game, :total_score)
  end

end
