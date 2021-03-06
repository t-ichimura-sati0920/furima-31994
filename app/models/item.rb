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
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :cost_id
    validates :days_id
    validates :category_id
    validates :prefacture_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  def image_presence
    errors.add(:image, 'must be attached') unless image.attached?
  end
  
end
