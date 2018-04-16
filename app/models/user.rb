class User < ApplicationRecord
  has_many :playlists, dependent: :destroy
  has_many :friendships, dependent: :destroy
end
