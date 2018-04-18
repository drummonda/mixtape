class ChangeMixtapeManagerToCollections < ActiveRecord::Migration[5.1]
  def change
  	rename_table :mixtape_managers, :collections
  end
end
