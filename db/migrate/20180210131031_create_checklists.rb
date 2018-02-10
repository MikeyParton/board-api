class CreateChecklists < ActiveRecord::Migration[5.1]
  def change
    create_table :checklists do |t|
      t.references :card, index: true
      t.references :creator, index: true
      t.string :name
      t.string :status
      t.timestamps
    end
  end
end
