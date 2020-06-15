class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: @participation.user)
    end
  end

  def show?
    # creation de l'array des participants du @game
    participants = record.participations.map do |participation|
      participation.user
    end
    # le @game.user interrogé par authorize doit être
    # - le user connecté
    # OU
    # - un user présent dans l'array des participants
    record.user == user || !([user] & participants).empty?
  end

  def new?
    true
  end

  def create?
    true
  end

  def created?
    participants = record.participations.map do |participation|
      participation.user
    end
    record.user == user || !([user] & participants).empty?
  end

  def edit?
    record.user == @user
  end

  def update?
    record.user == @user
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
