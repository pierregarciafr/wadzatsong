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
end
