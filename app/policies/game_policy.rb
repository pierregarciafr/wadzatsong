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
    false
  end

  def create?
    true
  end

  def edit?
    true
    # record.user == user
  end

  def update?
    false
  end


end
