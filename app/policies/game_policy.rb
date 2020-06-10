class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: @participation.user)
    end
  end

  def show?
    participants = record.participations.map do |participation|
      participation.user
    end
    record.user == user || !![user] & participants
  end

  def new?
  end

  def create?
    true
  end

  def edit?
    record.user == @user
  end

  def update?
    record.user == @user
  end

  def ready?
    true
  end

  def paused?
    participants = record.participations.map do |participation|
      participation.user
    end
    record.user == user || !![user] & participants
  end

  def running?
    participants = record.participations.map do |participation|
      participation.user
    end
    record.user == user || !![user] & participants
  end

end
