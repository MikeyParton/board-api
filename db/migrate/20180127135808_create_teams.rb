class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :account, index: true
      t.jsonb :permissions, null: false, default: {}
      t.timestamps
    end
  end
end
