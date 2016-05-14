class AddRatingToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :rating, :float
  end
end
