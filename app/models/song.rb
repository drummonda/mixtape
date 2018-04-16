class Song < ApplicationRecord
  belongs_to :playlist
  #Mounts paperclip mp3
  has_attached_file :mp3
  # Validates that attachment is an audio file
  validates_attachment_content_type :mp3, :content_type => { content_type: [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ], file_name: { :matches => [/mp3\Z/]}
end
