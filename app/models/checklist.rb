class Checklist < ApplicationRecord
  belongs_to :card
  belongs_to :creator, class_name: 'User'
  has_many :checklist_items
end
