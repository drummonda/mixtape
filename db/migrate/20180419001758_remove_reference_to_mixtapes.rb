class RemoveReferenceToMixtapes < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :collections, :mixtape, index: true, foreign_key: true
  end
end
