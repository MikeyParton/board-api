require 'rails_helper'

RSpec.describe ChecklistItem, type: :model do
  let(:checklist_item) { create(:checklist_item) }
  let(:creator) { checklist_item.creator }

  describe 'base state transitions' do
    it 'changes state on complete/undo' do
      expect(checklist_item).to have_state(:pending)
      expect(checklist_item).to transition_from(:completed).to(:pending).on_event(:undo)
    end

    context 'when status is pending' do
      context 'with no completed_by set' do
        it { expect(checklist_item).not_to allow_event(:complete) }
      end

      context 'with no completed_by set' do
        before { checklist_item.completed_by = creator }
        it { expect(checklist_item).to transition_from(:pending).to(:completed).on_event(:complete) }
      end
    end
  end
end
