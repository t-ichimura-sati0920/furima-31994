FactoryBot.define do
  factory :order_address do
    postal_code   { Faker::Address.zip_code }
    prefacture_id { Faker::Number.between(from: 1, to: 47) }
    city          { '八潮市' }
    address       { '大瀬1-1-1' }
    bulding_name  { Faker::Address.building_number }
    phone_number  { Faker::PhoneNumber.cell_phone.gsub(/-/, '') }
    user_id       { nil }
    item_id       { nil } 
  end
end 