FactoryBot.define do
  factory :list do
    name { FFaker::HipsterIpsum.phrase }
    board
  end
end
