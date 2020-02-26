class ParticipationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(record.user = user)
    end
  end
#
  def new?
    record.user == current_user
  end
end
