FactoryBot.define do
  factory :team do
    name { FFaker::Name.name }
    trainer { build(:trainer)}
  end
end
