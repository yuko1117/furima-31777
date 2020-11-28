FactoryBot.define do
  factory :item_purchase do
    post_code {'123-4567'}
    shipping_area_id {2}
    city {'中央区'}
    address {'1-1-1'}
    building_name {'東京ハイツ'}
    phone_number {'09012345678'}
    item_id {'1'}
  end
end
