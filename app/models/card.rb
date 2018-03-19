class Card < ApplicationRecord
  include HasRandomSlug
  has_random_slug

  belongs_to :list
  has_one :board, through: :list
  has_many :checklists
  has_many :card_users, dependent: :destroy
  has_many :users, through: :card_users
  has_many :card_labels, dependent: :destroy
  has_many :labels, through: :card_labels
  has_many :timers

  acts_as_list scope: :list

  def current_timer
    timers.today.first
  end
end
