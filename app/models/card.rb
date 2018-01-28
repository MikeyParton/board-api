class Card < ApplicationRecord
  include HasPrefixedSlug
  has_prefixed_slug :name, :next_card_count

  belongs_to :list
  has_one :board, through: :list
  acts_as_list scope: :list

  after_create :update_board_cards_count

  def next_card_count
    board.cards_count + 1
  end

  def update_board_cards_count
    board.update(cards_count: next_card_count)
  end
end
