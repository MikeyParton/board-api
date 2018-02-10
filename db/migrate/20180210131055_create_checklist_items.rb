class CreateChecklistItems < ActiveRecord::Migration[5.1]
  def change
    create_table :checklist_items do |t|
      t.references :checklist, index: true
      t.references :creator, index: true
      t.references :completed_by, index: true
      t.string :name
      t.string :status
      t.timestamps
    end
  end
end
