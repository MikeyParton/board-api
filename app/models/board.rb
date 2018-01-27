class Board < ApplicationRecord
  belongs_to :account
  has_many :lists, -> { order(position: :asc) }, dependent: :destroy
  has_many :cards, through: :lists
  has_many :team_boards
  has_many :teams, through: :team_boards
end
