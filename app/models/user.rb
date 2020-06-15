class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games
  has_many :participations
  has_many :answers

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
end
