class ChangeMixtapeModuleToMix < ActiveRecord::Migration[5.1]
  def change
    rename_table :mixtapes, :mixes
  end
end
