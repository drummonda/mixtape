class ChangeCollectionReferenceToMix < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :collections, :mixtapes, foreign_key: true
  	add_reference :collections, :mix, foreign_key: true
  end
end
