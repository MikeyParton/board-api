class CreateTeamMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :team_members do |t|
      t.references :user, index: true
      t.references :team, index: true
      t.timestamps
    end
  end
end
