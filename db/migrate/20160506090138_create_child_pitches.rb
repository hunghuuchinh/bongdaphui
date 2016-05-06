class CreateChildPitches < ActiveRecord::Migration
  def change
    create_table :child_pitches do |t|
      t.string :name
      t.string :status
      t.references :pitch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
