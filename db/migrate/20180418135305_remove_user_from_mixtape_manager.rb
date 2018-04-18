class RemoveUserFromMixtapeManager < ActiveRecord::Migration[5.1]
  def change
  	remove_column :mixtape_managers, :user_id
  end
end
