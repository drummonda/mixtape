class Song < ApplicationRecord
  has_many :song_users
  has_many :users, through: :song_users
  has_many :collections
  has_many :mixes, through: :collections
  # Mounts paperclip mp3
  has_attached_file :mp3, validate_media_type: false
  # Validates that attachment is an audio file
  # validates_attachment_content_type :mp3, content_type: { matches: [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg-3','audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio', 'application/octet-stream' ] }
  # Validate filename
  # validates_attachment_file_name :mp3, { matches: [/mp3\Z/, /mp4\Z/] }
  # Do not validate mediat type
  do_not_validate_attachment_file_type :mp3
  # Title must be present, 5 chars in length
  validates :song_title, presence: true, length: { minimum: 5 }
  # Artist must be present, 5 chars in length
  validates :song_artist, presence: true, length: { minimum: 2 }

  def s3_path(style: nil)
    mp3.s3_object(style).presigned_url('get', expires_in: 10.seconds)
  end
end
