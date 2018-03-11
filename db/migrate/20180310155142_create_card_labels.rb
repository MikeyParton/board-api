class CreateCardLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :card_labels do |t|
      t.references :card, index: true
      t.references :label, index: true
      t.timestamps
    end
  end
end
