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

end
