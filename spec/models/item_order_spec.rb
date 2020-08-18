require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品購入機能' do
    before do
      @buyer = FactoryBot.build(:item_order)
      @seller = FactoryBot.build(:item_order)
      @seller.user_id = 1
    end

    context '購入登録成功' do
      it 'すべての値が正しく入力されていれば保存できること' do
        @seller.valid?
        expect(@seller.errors.full_messages).to include("Token can't be blank")
      end
    end
    context '購入登録失敗' do
      it '郵便番号が空では決済できない' do
        @buyer.postal_code = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が空では決済できない' do
        @buyer.prefecture_id = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では決済できない' do
        @buyer.city = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では決済できない' do
        @buyer.addresses = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空では決済できない' do
        @buyer.phone_number = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号にはハイフンが必須であること' do
        @buyer.postal_code = '1234567'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Postal code is invalid')
      end
      it '電話番号にはハイフンが必須であること' do
        @buyer.phone_number = '090-1234-5678'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
