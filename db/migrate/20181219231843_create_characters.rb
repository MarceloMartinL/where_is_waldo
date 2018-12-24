class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.references :game, foreign_key: true
      t.integer :x0
      t.integer :x1
      t.integer :y0
      t.integer :y1

      t.timestamps
    end
  end
end
