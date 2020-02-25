class Playlist < ApplicationRecord
  has_many :tracks
  has_many :games
end
