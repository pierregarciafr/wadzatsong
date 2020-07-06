class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :game
  # before_validation :check_user
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.total_score ||= 0
  end


end
