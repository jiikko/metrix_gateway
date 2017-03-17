class CreateRows < ActiveRecord::Migration[5.0]
  def change
    create_table :rows do |t|
      t.string :key, null: false
      t.float :value, null: false, default: 0
      t.integer :board_id, null: false, index: true
      t.date :on, null: false
      t.index [:board_id, :on, :key, :value], unique: true

      t.timestamps
    end
  end
end
