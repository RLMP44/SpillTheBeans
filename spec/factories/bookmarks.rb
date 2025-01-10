FactoryBot.define do
  factory :bookmark do
    comment { 'For family parties' }
    association :list
    association :recipe
  end
end
