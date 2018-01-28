require "rails_helper"

RSpec.describe Card do
  describe "slug generation" do
    let(:account) { create(:account) }
    let(:board_1) { create(:board, account: account) }
    let(:list_1)  { create(:list, board: board_1) }
    let(:card_1)  { create(:card, list: list_1) }
    let(:card_2)  { create(:card, list: list_1) }

    let(:board_2) { create(:board, account: account) }
    let(:list_2)  { create(:list, board: board_2) }
    let(:card_3)  { create(:card, list: list_2) }

    context "creating cards" do

      it "prefixes the slugs with sequential numbers scoped to the board" do
        expect(card_1.slug_prefix[0]).to eq("1")
        expect(card_2.slug_prefix[0]).to eq("2")
        expect(card_3.slug_prefix[0]).to eq("1")
      end
    end

    context "updating the name of an existing board" do
      it "doesn't change the slug prefix" do
        expect {
          card_1.update(name: "New name")
        }.not_to change { card_1.slug_prefix }
      end
    end
  end
end
