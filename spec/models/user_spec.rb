require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録：正常系' do
    it "全ての欄を埋めて指定された条件を満たしている時" do
      expect(@user).to be_valid
    end
  end

  describe 'ユーザー新規登録:異常系' do
    it "nicknameが空だと新規登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空の場合に新規登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailが既にある(一意性でない)場合に新規登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
      #expect(user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに＠を含まない場合に新規登録できない" do
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空の場合に新規登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが6文字以上でない場合新規登録できない" do
      @user.password = "Aa2bb"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角英数字混合出ない場合に新規登録できない" do
      @user.password = "aaabbb"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "nameが空だと新規登録できない" do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "nameが全角で入力されてない場合に新規登録できない" do
      @user.name = "aiueo"
      @user.valid?
      expect(@user.errors.full_messages).to include( "Name Full-width characters")
    end
    it "last_nameが空だと新規登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameが全角で入力されてない場合に新規登録できない" do
      @user.last_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end
    it "kana_nameが空の場合に新規登録できない" do
      @user.kana_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana name can't be blank")
    end
    it "kana_nameが全角カタカナで入力されてない場合に新規登録できない" do
      @user.kana_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana name is invalid")
    end
    it "kana_last_nameが空の場合に新規登録できない" do
      @user.kana_last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end
    it "kana_last_nameが全角カタカナで入力されてない場合に新規登録できない" do
      @user.kana_last_name ="ｶｷｸｹｺ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name is invalid")
    end
    it "生年月日が入力されてない場合に新規登録ができない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
