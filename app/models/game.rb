class Game < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
  has_many :participations
  has_many :answers
  enum status: [ :created, :running, :paused, :finished ]
end
