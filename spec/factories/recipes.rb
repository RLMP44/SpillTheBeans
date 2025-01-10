FactoryBot.define do
  factory :recipe do
    name { 'Pesto bowl' }
    description { 'Pesto and chicken and rice.' }
    rating { 7.9 }
    association :user
  end
end
