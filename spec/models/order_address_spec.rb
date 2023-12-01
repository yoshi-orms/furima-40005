require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'zip_codeとprefecture_idとcityとstreetとbuildingとphone_numberが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it ' 郵便番号が必須であること' do
        @order_address.zip_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Zip code can't be blank"
      end

      it ' 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order_address.zip_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Zip code is invalid"
      end

      it ' 都道府県が必須であること' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture is not a number"
      end

      it ' 市区町村が必須であること' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end

      it ' 番地が必須であること' do
        @order_address.street = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Street can't be blank"
      end

      it ' 建物名は任意であること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end

      it ' 電話番号が必須であること' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end

      it ' 電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end
    end
  end
end
