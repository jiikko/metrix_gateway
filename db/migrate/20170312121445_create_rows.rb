class CreateRows < ActiveRecord::Migration[5.0]
  def change
    create_table :rows do |t|
      t.string :key, null: false
      t.float :value, null: false, default: 0
      t.integer :board_id, null: false, index: true
      t.index [:board_id, :created_at, :key]

      t.timestamps
    end
  end
end
