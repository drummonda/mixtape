json.extract! song, :id, :song_title, :song_artist, :playlist_id_id, :created_at, :updated_at
json.url song_url(song, format: :json)
