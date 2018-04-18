class ChangePlaylistNameToMixTape < ActiveRecord::Migration[5.1]
  def change
    rename_table :playlists, :mixtapes
  end
end
