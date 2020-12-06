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

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
