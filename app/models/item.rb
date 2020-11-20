class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :days_unril_shipping
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :status
  belong_to :user
  has_one_attached :image

  validates :images, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :status_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_fee, presence: true, numericality: { other_than: 1 }
  validates :shipping_area, presence: true, numericality: { other_than: 1 }
  validates :days_until_shipping_id, presence: true, numericality: { other_than: 1 }
  validates :selling_price, presence: true
end
