FactoryBot.define do
  factory :card do
    name { FFaker::HipsterIpsum.phrase }
    list
  end
end
