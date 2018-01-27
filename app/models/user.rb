class User < ApplicationRecord
  has_many :team_members
  has_many :teams, through: :team_members
  has_many :boards, through: :teams

  validates_presence_of :first_name, :last_name, :email, :password_digest
  validates :email, uniqueness: true

  has_secure_password
end
