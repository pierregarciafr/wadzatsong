class Game < ApplicationRecord
  belongs_to :user
  belongs_to :playlist, optional: true
  has_many :participations
  has_many :participants, through: :participations, source: :user
  has_many :answers
  # has_many :tracks, through: :playlists
  enum status: [ :created, :running, :paused, :finished ]
  validates :token, presence: true, uniqueness: true
  before_save :set_token


  private

  def set_token
    # while !self.valid?
      puts 'coucou'
      self.token = SecureRandom.hex(3)
    # end
  end
end



