class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :time
      t.date :date_order
      t.references :user, index: true, foreign_key: true
      t.references :child_pitch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
