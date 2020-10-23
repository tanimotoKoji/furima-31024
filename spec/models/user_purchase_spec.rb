require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    @seller = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @seller.id)
    @buyer = FactoryBot.create(:user)
    @user_purchase = FactoryBot.build(:user_purchase, user_id: @seller.id, item_id: @item.id, user_id: @buyer.id)
  end

  it"トークンと郵便番号と住所と電話番号があれば登録できること" do
    expect(@user_purchase).to be_valid
  end
  
  it "tokenが空では登録できないこと" do
    @user_purchase.token = nil
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
  end
  
  it "post_numberが空では登録できないこと" do
    @user_purchase.post_number = nil
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Post number can't be blank")
  end

  it "post_numberが1つのハイフンと7つの数字であれば登録できる" do
    @user_purchase.post_number = "711-9999"
    expect(@user_purchase).to be_valid
  end

  it "post_numberにハイフンがないと登録できないこと" do
    @user_purchase.post_number = "71199999"
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
  end

  it "prefecture_idが０だと登録できない" do
    @user_purchase.prefecture_id = 0
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Prefecture must be other than --")
  end

  it "cityが空だと登録できない" do
    @user_purchase.city = nil
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("City can't be blank")
  end

  it "house_numberが空だと登録できない" do
    @user_purchase.house_number = nil
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("House number can't be blank")
  end

  it "phone_numberが11桁未満だと登録できない" do
    @user_purchase.phone_number = "123456789"
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
  end

  it "phone_numberが12桁以上だと登録できない" do
    @user_purchase.phone_number = "123456789123"
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
  end
 
  it "phone_numberが空だと登録できない" do
    @user_purchase.phone_number = nil
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
  end

  it "phone_numberに数字以外が入ると登録できない" do
    @user_purchase.phone_number = "-0000000000"
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
  end

  it "user_idが空だと購入できない" do
    @user_purchase.user_id = ""
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("User can't be blank")
  end

  it "item_idが空だと購入できない" do
    @user_purchase.item_id = ""
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Item can't be blank")
  end
end