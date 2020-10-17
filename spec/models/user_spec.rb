require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname、email、password、password_confirmation、last_name、first_name、
        last_name_kana、first_name_kana、birth_dateが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    
    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailが重複する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
  

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it "passwordが６文字以上、半角英数字の組み合わせであれば登録できること" do
      @user.password = "tanimoto1"
      @user.password_confirmation = "tanimoto1"
      expect(@user).to be_valid
    end

    it "passwordが数字のみの場合は登録できないこと" do
      @user.password = "1234567"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが英字のみの場合は登録できないこと" do
      @user.password = "abcdefg"
      @user.password_confirmation = "abcdefg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end


    it "passwordが５文字以内であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "password_confirmationがpasswordと一致していないと登録できないこと" do
      @user.password = "tanimoto1"
      @user.password_confirmation = "tanimoto2"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
      
    it "last_nameが空だと登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_nameが空だと登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

     it "last_nameが半角英数字だと登録できないこと" do
      @user.last_name = "ssssss"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end 
    
     it "last_nameが数字だと登録できないこと" do
      @user.last_name = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end 

     it "first_nameが半角英字だと登録できないこと" do
      @user.first_name = "ssssss"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
     end 

     it "first_nameが数字だと登録できないこと" do
      @user.first_name = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
     end 
    
     it "last_name_kanaが空だと登録できないこと" do
       @user.last_name_kana = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end

     it "first_name_kanaが空だと登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end

     it "last_name_kanaが半角英字だと登録できないこと" do
      @user.last_name_kana = "sssss"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "last_name_kanaが数字だと登録できないこと" do
      @user.last_name_kana = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "last_name_kanaが漢字だと登録できないこと" do
      @user.last_name_kana = "谷本光司"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "first_name_kanaが半角英字だと登録できないこと" do
      @user.first_name_kana = "sssss"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    
    it "first_name_kanaが数字だと登録できないこと" do
      @user.first_name_kana = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "first_name_kanaが漢字だと登録できないこと" do
      @user.first_name_kana = "谷本光司"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "last_nameとfirst_nameが全角文字だと登録できること" do
      @user.last_name = "たにもと"
      @user.first_name = "こうじ"
      expect(@user).to be_valid
    end

    it "last_name_kanaとfirst_name_kanaがカタカナだと登録できること" do
      @user.last_name = "タニモト"
      @user.first_name = "コウジ"
      expect(@user).to be_valid
    end



    it "birth_dateが空だと登録できないこと" do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
