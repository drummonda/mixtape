class ChangeSongReference < ActiveRecord::Migration[5.1]
  def change
  	remove_column :songs, :playlist_id_id
  	add_reference :songs, :user, foreign_key: true
  end
end
