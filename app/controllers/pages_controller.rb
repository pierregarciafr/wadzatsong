class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @game = Game.new(user: current_user)  if user_signed_in?
    @user = current_user
  end
end
