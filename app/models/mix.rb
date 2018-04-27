class Mix < ApplicationRecord
  belongs_to :user
  has_many :collections
  has_many :songs, through: :collections

  # Name must be present, 5 chars in length
  validates :mix_name, presence: true, length: { minimum: 5 }


  # Add a song to a mix by creating a collection for the song + mix
  def add_song(song)
    return if Song.find_by_id(song).nil?
    self.songs << song
  end

  # Remove a song from a mix by deleting the collection that connects them
  def remove_song(song)
  	return if Song.find_by_id(song).nil?
    self.songs.delete(song)
  end
end
