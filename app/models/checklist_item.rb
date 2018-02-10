class ChecklistItem < ApplicationRecord
  include AASM

  belongs_to :checklist
  has_one :card, through: :checklist
  belongs_to :creator, class_name: 'User'
  belongs_to :completed_by, class_name: 'User', optional: true
  belongs_to :timer, optional: true

  aasm column: 'status' do
    state :pending, initial: true
    state :completed

    event :complete do
      transitions from: :pending, to: :completed, if: :valid_completion?
    end

    event :undo do
      transitions from: :completed, to: :pending
    end
  end

  def valid_completion?
    completed_by.present?
  end
end
