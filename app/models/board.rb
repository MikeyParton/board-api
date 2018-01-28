class Board < ApplicationRecord
  include HasPrefixedSlug
  has_prefixed_slug :name, :next_board_count

  belongs_to :account, counter_cache: true
  has_many :lists, -> { order(position: :asc) }, dependent: :destroy
  has_many :cards, through: :lists
  has_many :team_boards
  has_many :teams, through: :team_boards

  def next_board_count
    account.boards_count + 1
  end
end
