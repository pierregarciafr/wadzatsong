class GamePolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.where(user: @game.user)
  #   end
  # end

  def show?
    record.user == user || record.participants.include?(user)

  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    record.user == user || record.participants.include?(user)
  end

  def paused?
    true
  end

  def running?
    true
  end

end
