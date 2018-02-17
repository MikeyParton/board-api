class AddNumbersToBoardsAndCards < ActiveRecord::Migration[5.1]
  def change
    add_column :boards, :number, :integer
    add_column :cards, :number, :integer
  end
end
