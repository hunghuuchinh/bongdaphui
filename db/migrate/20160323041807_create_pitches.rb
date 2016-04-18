class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :name
      t.string :address
      t.integer :quantity
      t.string :image
      t.boolean :rent_shoes
      t.boolean :rent_ball
      t.boolean :rent_kit
      t.boolean :have_lamp
      t.integer :cost
      t.float :lat
      t.float :lng
      t.string :county
      t.float :rating
      t.text :description
      t.string :phone
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :pitches, [:user_id, :created_at]
  end
end
