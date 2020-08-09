require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it '全ての項目が存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'nameが空では保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'infoが空では保存できないこと' do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it 'カテゴリが1では保存できないこと' do
      @item.category_id = 1
      @item.sales_status_id = 1
      @item.shipping_fee_status_id = 1
      @item.prefecture_id = 1
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select',
                                                    'Sales status Select',
                                                    'Shipping fee status Select',
                                                    'Prefecture Select',
                                                    'Scheduled delivery Select')
    end

    it 'カテゴリが空では保存できないこと' do
      @item.category_id = nil
      @item.sales_status_id = nil
      @item.shipping_fee_status_id = nil
      @item.prefecture_id = nil
      @item.scheduled_delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select',
                                                    'Sales status Select',
                                                    'Shipping fee status Select',
                                                    'Prefecture Select',
                                                    'Scheduled delivery Select')
    end

    it 'priceが空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300以下では保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが9999999より大きくては保存できないこと' do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'priceが数字以外では保存できないこと' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
