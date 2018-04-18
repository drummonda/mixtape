class Song < ApplicationRecord
  belongs_to :user
  has_many :collections
  has_many :mixtapes, through: :collections
  #Mounts paperclip mp3
  has_attached_file :mp3
  # Validates that attachment is an audio file
  validates_attachment_content_type :mp3, content_type: { matches: [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ] }, file_name: { matches: [/mp3\Z/]}
  # Title must be present, 5 chars in length
  validates :song_title, presence: true, length: { minimum: 5 }
  # Artist must be present, 5 chars in length
  validates :song_artist, presence: true, length: { minimum: 5 }
end
