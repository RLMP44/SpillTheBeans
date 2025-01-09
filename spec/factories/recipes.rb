FactoryBot.define do
  factory :recipe do
    name { 'Pesto bowl' }
    description { 'Pesto and chicken and rice.' }
    association :user
  end
end
