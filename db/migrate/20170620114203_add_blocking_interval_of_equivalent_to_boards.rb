class AddBlockingIntervalOfEquivalentToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :blocking_interval_of_equivalent, :integer, default: 0, null: false
  end
end
