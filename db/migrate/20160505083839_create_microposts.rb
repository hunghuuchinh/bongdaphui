class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :title
      t.text :content
      t.string :picture_micropost
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :microposts, [:user_id, :created_at]
  end
end