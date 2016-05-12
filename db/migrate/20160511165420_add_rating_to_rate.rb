class AddRatingToRate < ActiveRecord::Migration
  def change
    add_column :rates, :rating, :integer
  end
end
