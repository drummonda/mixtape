class ChangeMixTapeNameColumnToMix < ActiveRecord::Migration[5.1]
  def change
    rename_column :mixes, :mixtape_name, :mix_name
  end
end
