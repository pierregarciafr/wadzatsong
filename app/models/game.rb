class Game < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
  has_many :participations
  has_many :answers
end
