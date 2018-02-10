class CreateTimers < ActiveRecord::Migration[5.1]
  def change
    create_table :timers do |t|
      t.references :user, index: true
      t.references :card, index: true
      t.string :status
      t.integer :seconds, default: 0, null: false
      t.datetime :started_at
      t.datetime :stopped_at
      t.timestamps
    end
  end
end
