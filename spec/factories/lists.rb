FactoryBot.define do
  factory :list do
    title { 'Dinner' }
    comment { 'wowza' }
    association :user
  end
end
