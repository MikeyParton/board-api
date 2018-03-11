require "rails_helper"

RSpec.describe Builder::Labels do
  describe '#build' do
    let(:builder) { Builder::Labels.new(board) }
    let(:board) { create(:board) }

    before do
      builder.build
    end

    it { expect(board.reload.labels.count).to eq(6) }
  end
end
