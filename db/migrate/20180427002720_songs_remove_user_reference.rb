class SongsRemoveUserReference < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :songs, :users, foreign_key: true
  end
end
