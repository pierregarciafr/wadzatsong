class Game < ApplicationRecord
  belongs_to :user
  belongs_to :playlist, optional: true
  has_many :participations
  has_many :participants, through: :participations, source: :user
  has_many :answers
  # has_many :tracks, through: :playlists
  enum status: [ :created, :running, :paused, :finished ]
  validates :user_id, presence: true
  validates :token, uniqueness: true
  before_validation :set_token
  after_initialize :set_defaults, unless: :persisted?

  NUMBER_OF_ROUNDS = 5

  def set_defaults
    self.total_score ||= 0
  end

  private

  def set_token
    if self.id.nil?
      self.token = SecureRandom.hex(3)
    end
    # set_token if Game.all.map{|game| game.token}.include?(self.token) # to check later / 20 06 20
  end
end



