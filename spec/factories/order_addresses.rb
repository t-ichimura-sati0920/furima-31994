FactoryBot.define do
  factory :order_address do
    postal_code   { "000-0000" }
    prefacture_id { Faker::Number.between(from: 1, to: 47) }
    city          { '八潮市' }
    address       { '大瀬1-1-1' }
    bulding_name  { Faker::Address.building_number }
    phone_number  { "09000000000" }
    token         {"tok_abcdefghijk00000000000000000"}
  end
end 