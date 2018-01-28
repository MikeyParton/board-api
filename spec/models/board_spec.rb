require "rails_helper"

RSpec.describe Board do
  describe "slug generation" do
    let(:account_1) { create(:account) }
    let(:board_1) { create(:board, account: account_1) }
    let(:board_2) { create(:board, account: account_1) }

    let(:account_2) { create(:account) }
    let(:board_3) { create(:board, account: account_2) }

    context "creating boards" do
      it "prefixes the slug with sequential numbers scoped by account" do
        expect(board_1.slug_prefix[0]).to eq("1")
        expect(board_2.slug_prefix[0]).to eq("2")
        expect(board_3.slug_prefix[0]).to eq("1")
      end
    end

    context "updating an existing board" do
      it "doesn't change the slug prefix" do
        expect {
          board_1.update(name: "New name")
        }.not_to change { board_1.slug_prefix }
      end
    end
  end
end
