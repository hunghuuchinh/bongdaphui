class RemoveRatingFromPitche < ActiveRecord::Migration
  def change
    remove_column :pitches, :rating, :float
  end
end
