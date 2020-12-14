class OrderAddress
  include ActiveModel::Model
  
  attr_accessor :postal_code, :prefacture_id, :city, :address, :bulding_name, :phone_number, :item_id, :user_id, :price, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address, :item_id, :user_id, :token
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "is invalid"}
  end

  validates :prefacture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefacture_id: prefacture_id, city: city, address: address, bulding_name: bulding_name, phone_number: phone_number, order_id: order.id)
  end

end
