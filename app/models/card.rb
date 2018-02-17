class Card < ApplicationRecord
  include HasRandomSlug
  has_random_slug

  belongs_to :list
  has_one :board, through: :list
  has_many :checklists

  acts_as_list scope: :list
end
