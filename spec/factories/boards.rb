FactoryBot.define do
  factory :board do
    name { FFaker::HipsterIpsum.phrase }
  end
end
