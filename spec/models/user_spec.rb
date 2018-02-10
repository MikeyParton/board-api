require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#complete' do
    let(:user)           { create(:user) }
    let(:checklist_item) { create(:checklist_item) }

    it 'sets the checklist_items completed_by to the user' do
      user.complete(checklist_item)
      expect(checklist_item.reload.completed_by).to eq(user)
    end
  end
end
