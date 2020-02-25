class Game < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
  has_many :participations
  has_many :participants, through: :participations, source: :users
  has_many :answers
  has_many :tracks, through: :playlists
  enum status: [ :created, :running, :paused, :finished ]
end
