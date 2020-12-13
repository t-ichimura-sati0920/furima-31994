require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      @order_address = FactoryBot.build(:order_address)
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address.user_id = @user.id
      @order_address.item_id = @item.id
      sleep(1)
    end

    context '商品購入がうまくいくとき' do
      it 'クレジットカード情報(token), postal_code, prefacture_id, city, bulding_number, address, phone_numberが存在していれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buldingは空でも購入できる' do
        @order_address.bulding_name = nil
        expect(@order_address).to be_valid
      end
    end
    
    context '商品購入がうまくいかないとき' do
      it 'クレジットカード情報(token)が空である場合は購入出来ない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'postal_cordが空である場合は購入出来ない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'postal_cordにハイフンが含まれていない場合は購入出来ない' do
        @order_address.postal_code = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'postal_cordが全角数字である場合は購入出来ない' do
        @order_address.postal_code = '１２３４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'postal_cordが3桁-4桁でない場合は購入出来ない' do
        @order_address.postal_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'prefacture_idが0である場合は購入出来ない' do
        @order_address.prefacture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'cityが空である場合は購入出来ない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'addressが空である場合は購入出来ない' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'phone_numberが空である場合は購入出来ない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'phone_numberが全角数字である場合は購入出来ない' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'phone_numberが11桁よりも多い場合は購入出来ない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'phone_numberについては英数字混合では登録できないこと（ハイフンがあれば登録できないこと）' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it '購入情報(user_id)が紐付いていない場合は購入出来ない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it '購入情報(item_id)が紐付いていない場合は購入出来ない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
    end
  end
end