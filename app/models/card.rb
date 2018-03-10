class Card < ApplicationRecord
  include HasRandomSlug
  has_random_slug

  belongs_to :list
  has_one :board, through: :list
  has_many :checklists
  has_many :card_users
  has_many :users, through: :card_users

  acts_as_list scope: :list
end
