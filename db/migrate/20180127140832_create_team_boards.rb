class CreateTeamBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :team_boards do |t|
      t.references :board, index: true
      t.references :team, index: true
      t.timestamps
    end
  end
end
