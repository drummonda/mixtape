class Mix < ApplicationRecord
  belongs_to :user
  has_many :collections
  has_many :songs, through: :collections

  # Name must be present, 5 chars in length
  validates :mix_name, presence: true, length: { minimum: 5 }


  # Add a song to a mix by creating a collection for the song + mix
  def add_song(song)
    return if Song.find_by_id(song.id).nil?
    Collection.create(mix: self, song: song)
  end

  # Remove a song from a mix by deleting the collection that connects them
  def remove_song(song)
  	return if Song.find_by_id(song.id).nil?
    Collection.where(mix_id: id, song_id: song.id).destroy_all
  end

  # Return all songs that exist in a mix - they share a collection
  def all_songs
    @collections = Collection.where(mix_id: id, song_id: nil)
    return if @collections.nil?
    @all_songs = []
    @collections.each do |collection|
      @song = Song.find_by_id(collection.song_id)
      @all_songs << @song
    end
    @all_songs
  end
end
