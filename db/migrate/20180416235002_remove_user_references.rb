class RemoveUserReferences < ActiveRecord::Migration[5.1]
  def change
  	remove_column :songs, :user_id
  	remove_column :mixtapes, :user_id
  end
end
