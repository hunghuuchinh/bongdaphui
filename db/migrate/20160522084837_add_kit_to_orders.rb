class AddKitToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :kit, :integer
  end
end
