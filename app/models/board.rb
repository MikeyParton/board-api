class Board < ApplicationRecord
  include HasRandomSlug
  has_random_slug

  belongs_to :account, counter_cache: true
  has_many :lists, -> { order(position: :asc) }, dependent: :destroy
  has_many :cards, through: :lists
  has_many :team_boards
  has_many :teams, through: :team_boards
end
