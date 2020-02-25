class ParticipationsController < ApplicationController

  def new
    @participation = Participation.new()

  end

  def create
    @participation = Participation.find(params[:id])
    @participation.user = current_user
  end

end
