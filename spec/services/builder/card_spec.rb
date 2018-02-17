require "rails_helper"

RSpec.describe Builder::Card do
  let(:builder) { Builder::Card.new(params) }

  describe "#save" do
    context "with valid params" do
      let(:board) { create(:board) }
      let(:list)  { create(:list, board: board) }
      let(:params) {{
        list_id: list.id,
        name: "Something good"
      }}

      before { builder.save }

      it "saves the card" do
        card = builder.card
        expect(card.persisted?).to be(true)
        expect(card.slug.present?).to be(true)
      end

      it "sets the card number" do
        expect(builder.card.number).to eq(1)
      end

      it "increments the boards card_count" do
        expect(board.reload.cards_count).to eq(1)
      end
    end

    context "with invalid params" do
      let(:params) {{
        dasd: "asdasd"
      }}

      it "returns false" do
        expect(builder.save).to be(false)
      end
    end
  end
end
