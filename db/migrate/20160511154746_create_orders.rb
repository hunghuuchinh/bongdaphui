class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, index: true, foreign_key: true
      t.references :child_pitch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
