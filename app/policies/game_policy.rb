class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: @participation.user)
    end
  end

  def new?
    true
    # record.user == user ## || record.game.user == user
  end

  def show?
    record.user == user
  end

  def create?
    true
  end

  def edit?
    true
    # record.user == user
  end

  def update?
    true
  end

  def paused?
    true
  end

  def running?
    true
  end

end
