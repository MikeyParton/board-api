require "rails_helper"

RSpec.describe Builder::Board do
  describe '#build' do
    let(:builder) { Builder::Board.new(params) }
    let(:params) {{
      account: create(:account),
      name: 'New Board'
    }}

    before do
      builder.save
    end

    it { expect(builder.board.persisted?).to be(true) }
    it { expect(builder.board.name).to eq('New Board') }
    it { expect(builder.board.labels.count).to be(6) }
  end
end
