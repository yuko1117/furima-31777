class ItemPurchase

  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :shipping_area_id, numericality: { other_than: 1, message:'Select'}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid Input full-width characters"}
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "Input only number"}
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name:building_name, phone_number:phone_number,purchase_id:purchase.id )
  end
end