class ParticipationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(record.user = user)
    end
  end
#
  def new?
    true
  end
end
