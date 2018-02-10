class AddTimerReferenceToChecklistItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :checklist_items, :timer, index: true
  end
end
