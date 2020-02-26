class Game < ApplicationRecord
  belongs_to :user
  belongs_to :playlist, optional: true
  has_many :participations
  has_many :participants, through: :participations, source: :user
  has_many :answers
  # has_many :tracks, through: :playlists
  enum status: [ :created, :running, :paused, :finished ]
  validates :token, uniqueness: true
  before_validation :set_token

  private

  def set_token
    if self.id.nil?
      self.token = SecureRandom.hex(3)
    end
  end
end



