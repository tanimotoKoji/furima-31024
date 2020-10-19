require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
    end

  describe '商品出品データの保存' do
    context "商品出品データが保存できる場合"
      it "画像と名前と詳細とカテゴリーとコンディションと配送料負担有無と配送元地域と配送日数と価格があれば登録できる亊" do
      expect(@item).to be_valid
      end

      it "価格が300〜9999999なら登録できる事" do
      @item.price = 9999999
      expect(@item).to be_valid
      end

      it "価格が半角数字なら登録できる事" do
      @item.price = 300
      expect(@item).to be_valid
      end



    context "商品出品データが保存できない場合"
      
      it "画像が空では保存できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")  
      end

      it "名前が空では保存できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")  
      end

      it "詳細が空では保存できない事" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")  
      end

      it "カテゴリーが--では保存できない事" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than --")
      end

      it "コンディションが--では保存できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than --")
      end

      it "配送料負担の有無が--では保存できない" do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than --")
      end

      it "配送元地域が--では保存できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than --")
      end

      it "配送日数が--では保存できない" do
        @item.handing_item_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Handing item must be other than --")
      end

      it "価格が空では保存できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "価格が300未満では保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "価格が9,999,999を超えると保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "価格が全角だと保存できない" do
        @item.price = "６００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end