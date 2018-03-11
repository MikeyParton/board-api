class AddCodeToLabels < ActiveRecord::Migration[5.1]
  def change
    add_column :labels, :code, :string
  end
end
