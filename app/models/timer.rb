class Timer < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :card
  has_many :checklist_items

  scope :today, -> { where("created_at > ?", Time.now.beginning_of_day) }

  aasm column: 'status' do
    state :fresh, initial: true
    state :started
    state :stopped

    event :start do
      transitions from: [:fresh, :stopped], to: :started, after: :after_start
    end

    event :stop do
      transitions from: :started, to: :stopped, after: :after_stop
    end
  end

  private

  def after_start
    update(started_at: Time.now)
  end

  def after_stop
    update(
      seconds: seconds + (Time.now - started_at).seconds,
      stopped_at: Time.now
    )
  end
end
