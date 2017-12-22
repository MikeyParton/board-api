require 'rails_helper'

RSpec.describe Reorder do
  let(:board_1)   { create(:board) }
  let!(:list_1)  { create(:list, board: board_1) }
  let!(:list_2)  { create(:list, board: board_1) }
  let!(:list_3)  { create(:list, board: board_1) }

  let(:board_2)   { create(:board) }
  let!(:list_4)  { create(:list, board: board_2) }
  let!(:list_5)  { create(:list, board: board_2) }
  let!(:list_6)  { create(:list, board: board_2) }

  before do
    Reorder.new(
      list_item: list_1,
      parent_key: "board_id",
      parent_id: parent_id,
      position: 2
    ).process
  end

  context 'moving within the same list' do
    let(:parent_id) { board_1.id }

    it 'moves list to new position' do
      expect(list_2.reload.position).to eq(1)
      expect(list_1.reload.position).to eq(2)
      expect(list_3.reload.position).to eq(3)
    end
  end

  context 'moving to another list' do
    let(:parent_id) { board_2.id }

    it 'moves list to new position' do
      expect(list_2.reload.position).to eq(1)
      expect(list_3.reload.position).to eq(2)

      expect(list_4.reload.position).to eq(1)
      expect(list_1.reload.position).to eq(2)
      expect(list_5.reload.position).to eq(3)
      expect(list_6.reload.position).to eq(4)
    end
  end
end
