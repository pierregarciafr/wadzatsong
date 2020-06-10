class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: @participation.user)
    end
  end

  def new? # n'importe quel user connecté peut créer un game
    true
    # Game.first.participations.map do |participation|
    #   participation.user
    # end
    # record.user == current_user || record.game.user == current_user
  end

  def show?
    true
    # record.user == user ## || record.game.user == user
  end

  def create?
    true
  end

  def edit?
    record.user == @user
  end

  def update?
    true
  end

  def ready?
    true
  end

  def paused?
    true
  end

  def running?
    true
  end

end
