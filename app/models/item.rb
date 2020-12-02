class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :days_until_shipping
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :status
  belongs_to :user
  
  has_one_attached :image
  has_one :purchase


  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1, message:'Select'}
    validates :status_id, numericality: { other_than: 1, message:'Select'}
    validates :delivery_fee_id, numericality: { other_than: 1, message:'Select'}
    validates :days_until_shipping_id, numericality: { other_than: 1, message:'Select'}
    validates :selling_price, format: { with:/\A[0-9]+\z/, message:'Half-width number'},numericality: {greater_than: 300, less_than:9999999,  message:'Out of setting range'}
  end  
end
