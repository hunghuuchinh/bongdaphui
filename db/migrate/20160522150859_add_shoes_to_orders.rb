class AddShoesToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shoes, :integer
  end
end
