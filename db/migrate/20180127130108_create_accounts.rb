class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.references :owner, index: true
      t.timestamps
    end
  end
end
