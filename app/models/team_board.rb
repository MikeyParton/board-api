class TeamBoard < ApplicationRecord
  belongs_to :team
  belongs_to :board
end
