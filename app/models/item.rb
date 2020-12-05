class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :cost
  belongs_to :days
  belongs_to :category
  belongs_to :prefacture

  with_options presence: true do
    validates :name
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
    validates :description
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

end