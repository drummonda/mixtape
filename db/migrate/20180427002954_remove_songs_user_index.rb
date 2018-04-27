class RemoveSongsUserIndex < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :songs, :users, index: true, foreign_key: true
  end
end
