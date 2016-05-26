class AddBallToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :ball, :integer
  end
end
