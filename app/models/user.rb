class User < ApplicationRecord
  has_many :team_members
  has_many :teams, through: :team_members
  has_many :boards, through: :teams
  has_many :timers
  has_many :card_users
  has_many :cards, through: :card_users

  validates_presence_of :first_name, :last_name, :email, :password_digest
  validates :email, uniqueness: true

  has_secure_password

  def complete(checklist_item)
    checklist_item.update(completed_by: self)
    checklist_item.complete
  end
end
