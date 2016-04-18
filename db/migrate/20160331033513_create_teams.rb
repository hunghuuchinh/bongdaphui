class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :county
      t.string :image
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
     add_index :teams, [:user_id, :created_at]
  end
end
