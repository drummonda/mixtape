class Mixtape < ApplicationRecord
  belongs_to :user
  has_many :collections
  has_many :songs, through: :collections

  # Name must be present, 5 chars in length
  validates :mixtape_name, presence: true, length: { minimum: 5 }
end
