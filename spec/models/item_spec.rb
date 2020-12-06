require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品が出品できる時' do
    it '全ての値が正常である時に保存できる' do
      expect(@item).to be_valid
    end
  end
    
    context '商品が出品できない時' do
    it '商品名が空だと保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

  it '商品の説明が空だと保存できないこと' do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end

  it '価格についての情報が空だと保存できないこと' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it 'priceが全角数字だと保存できないこと' do
    @item.price = '２０００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
  end

  it 'priceが300円未満では保存できないこと' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is out of setting range")
  end

  it 'priceが9,999,999円を超過すると保存できないこと' do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is out of setting range")
  end

  it 'prefectureを選択していないと保存できないこと' do
    @item.prefacture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include()
  end

  it 'カテゴリーを選択していないと保存できないこと' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include()
  end

  it '発送までの日数を選択していないと保存できないこと' do
    @item.days_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include()
  end

  it '配送料の負担を選択していないと保存できないこと' do
    @item.cost_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include()
  end

  it '商品の状態を選択していないと保存できないこと' do
    @item.status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include()
  end

  it 'imageが空だと保存できないこと' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include()
  end
end

  end
end