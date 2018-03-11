class Team < ApplicationRecord
  belongs_to :account

  has_many :team_members, dependent: :destroy
  has_many :users, through: :team_members

  has_many :team_boards, dependent: :destroy
  has_many :boards, through: :team_boards
end
