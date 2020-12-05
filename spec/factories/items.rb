FactoryBot.define do
  factory :item do
    name { 'あいうえお' }
    price{ 1000 }
    description{ 'かきくけこ' }
    status_id{ 2 }
    cost_id{ 2 }
    days_id { 2 }
    category_id { 2 }
    prefacture_id { 2 }
    association :user
    
  end
end
