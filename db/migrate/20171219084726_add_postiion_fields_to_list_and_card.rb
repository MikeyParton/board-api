class AddPostiionFieldsToListAndCard < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :position, :integer
    add_column :cards, :position, :integer
  end
end
