class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string :playlist_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
