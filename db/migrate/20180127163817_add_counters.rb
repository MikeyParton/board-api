class AddCounters < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :boards_count, :integer, null: false, default: 0
    add_column :boards, :cards_count, :integer, null: false, default: 0
  end
end
