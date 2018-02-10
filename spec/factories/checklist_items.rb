FactoryBot.define do
  factory :checklist_item do
    name { 'Sub-todo' }
    checklist
    creator
  end
end
