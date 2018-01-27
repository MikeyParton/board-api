class AddAccountIdToBoards < ActiveRecord::Migration[5.1]
  def change
    add_reference :boards, :account, index: true
  end
end
