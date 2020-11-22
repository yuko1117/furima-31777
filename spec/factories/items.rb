FactoryBot.define do
  factory :item do
    name {"名前"}
    explanation {"商品説明"}
    category_id {2}
    status_id {2}
    delivery_fee_id {2}
    shipping_area_id {2}
    days_until_shipping_id {2}
    selling_price {1000}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.jpg'))}
    association :user 
     
  end
end
