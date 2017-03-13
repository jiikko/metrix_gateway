class CreateRows < ActiveRecord::Migration[5.0]
  def change
    create_table :rows do |t|
      t.string :key, null: false
      t.integer :value, null: false, default: 0
      t.integer :board_id, null: false, index: true
      t.index [:key, :value, :board_id], unique: true

      t.timestamps
    end
  end
end
