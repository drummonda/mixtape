class CreateSongUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :song_users do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
    end
  end
end
