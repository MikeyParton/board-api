class Card < ApplicationRecord
  belongs_to :list
  has_one :board, through: :list

  acts_as_list scope: :list
end
