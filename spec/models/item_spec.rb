require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の保存' do
    context '商品出品が保存できる場合' do
      it '全ての入力条件を満たしたら保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品保存が上手くいかない場合' do
      it '商品名が空だと登録できない'do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空だと登録できない'do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの選択がないと登録できない'do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it '商品の選択がないと登録できない'do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it '配送料の選択がないと登録できない'do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end
      it '配送元の地域の選択がないと登録できない'do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area Select")
      end
      it '発送までの日数の選択がないと登録できない'do
        @item.days_until_shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipping Select")
      end  
      it '価格の入力がないと登録できない'do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it '価格は￥300以上でないと登録できない'do
        @item.selling_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price Out of setting range")
      end
      it '価格は￥9,999,999をで超えると登録できない'do
        @item.selling_price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price Out of setting range")
      end
      it '価格は半角数字で入力されてないと登録できない'do
        @item.selling_price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price Out of setting range")
      end
      it '画像が空だと登録できない'do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
