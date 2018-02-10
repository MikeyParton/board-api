FactoryBot.define do
  factory :board do
    name { FFaker::HipsterIpsum.phrase }
    account
  end
end
