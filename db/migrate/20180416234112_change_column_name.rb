class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :mixtapes, :playlist_name, :mixtape_name
  end
end
