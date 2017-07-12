class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
end
