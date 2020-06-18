class Answer < ApplicationRecord
  belongs_to :game
  belongs_to :track
  belongs_to :user
  validates :content, presence: true

  def self.best_chrono_ever
  fastest_answer = Answer.where(status:true).order(answering_time: :ASC).first
  fastest_answer ? { chrono: fastest_answer.answering_time,
                     user: fastest_answer.user,
                     pseudo: fastest_answer.user.pseudo,
                     title: fastest_answer.track.title,
                     artist: fastest_answer.track.artist
                    } : '-'
  end

  def self.good_answers_per_genre

  end
end
