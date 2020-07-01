class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: @participation.user) # no use.
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
    record.user = user  # doesn't verify the test post game: { user: @other_user } - user scope
  end

  def created?
    participants = record.participations.map do |participation|
      participation.user
    end
    record.user == user || !([user] & participants).empty?
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def paused?
    participants = record.participations.map do |participation|
      participation.user
    end
    record.user == user || !([user] & participants).empty?
  end

  def running?
    participants = record.participations.map do |participation|
      participation.user
    end
    record.user == user || !([user] & participants).empty?
  end

end
