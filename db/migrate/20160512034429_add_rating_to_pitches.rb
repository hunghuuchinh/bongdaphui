class AddRatingToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :rating, :integer
  end
end
