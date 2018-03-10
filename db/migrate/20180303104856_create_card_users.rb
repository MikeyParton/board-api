class CreateCardUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :card_users do |t|
      t.references :user, index: true
      t.references :card, index: true
      t.timestamps
    end
  end
end
