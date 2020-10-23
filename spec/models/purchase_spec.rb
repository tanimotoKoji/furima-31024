require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  it "カード情報と住所と電話番号があれば登録できること" do
   expect(@purchase).to be_valid
  end

  
  



end
