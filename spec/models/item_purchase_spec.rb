require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      @item_purchase = FactoryBot.build(:item_purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_purchase).to be_valid
    end
    it '郵便番号が空だと登録できない'do
      @item_purchase.post_code = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号にハイフンがないと登録できない'do
      @item_purchase.post_code = '1234567'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Post code Input correctly")
    end
    it '都道府県が空だと登録できない'do
      @item_purchase.shipping_area_id = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Shipping area Select")
    end
    it '都道府県の選択が(---)だと登録できない'do
      @item_purchase.shipping_area_id = 1
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Shipping area Select")
    end
    it '市区町村が空だと登録できない'do
      @item_purchase.city = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("City can't be blank")
    end
    it '市区町村が全角ひらがな、全角カタカナ、漢字以外で入力されると登録できない'do
      @item_purchase.city = 'aaa'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("City is invalid Input full-width characters")
    end
    it '番地が空だと登録できない'do
      @item_purchase.address = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと登録できない'do
      @item_purchase.address = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと登録できない'do
      @item_purchase.phone_number = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が半角数字以外で入力されると登録できない'do
      @item_purchase.phone_number = 'aaabbbcccdd'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Phone number Input only number")
    end
  end
end