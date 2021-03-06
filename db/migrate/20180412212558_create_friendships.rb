class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.string :state
      t.references :user, foreign_key: true
      t.references :friend

      t.timestamps
    end
  end
end
