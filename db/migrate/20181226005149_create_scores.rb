class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.decimal :time, precision: 8, scale: 2
      t.references :game, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
