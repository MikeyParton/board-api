class Label < ApplicationRecord
  belongs_to :board
  has_many :card_labels
  has_many :cards, through: :card_labels

  validates_presence_of :color
end
