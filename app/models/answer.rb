class Answer < ApplicationRecord
  belongs_to :game
  belongs_to :track
  belongs_to :user
  # validates :content, presence: true
end
