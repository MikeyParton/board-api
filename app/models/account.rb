class Account < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :boards
  has_many :teams
end
