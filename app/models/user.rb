class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games, dependent: :nullify
  has_many :participations
  has_many :answers
  validates :pseudo, length: { maximum: 50 }
  validates :email, uniqueness: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Password.create(string, cost: cost)
  end

  def test(param)
    return param.nil? || param.zero? ? '-' : param
  end

  def highest_score
    highestscore = []
    if self.games.count != 0
      highestscore << self.games.order(total_score: :desc).first.total_score
    end
    if self.participations.count !=0
      highestscore << self.participations.order(total_score: :desc).first.total_score
    end
    highestscore.sort.last ? highestscore.sort.last : '-'
  end

  def played_tracks
    (games.count + participations.count) * Game::NUMBER_OF_ROUNDS
  end

  def good_answers_percentage
    return '-' if games.count == 0 && participations.count == 0
    played_tracks != 0 ? (answers.where(status: true).count * 100) / played_tracks : '-'
  end

  def best_chrono
    right_answers = answers.where(status:true).order(answering_time: :ASC).first
    right_answers ? right_answers.answering_time : '-'
  end

end
