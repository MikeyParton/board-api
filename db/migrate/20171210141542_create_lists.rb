class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.references :board, index: true
      t.string :name
      t.timestamps
    end
  end
end
