require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー新規登録' do
    it "nicknameが空だと新規登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空の場合に新規登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが一意性でない場合に新規登録できない" do
      #user = @user.dup
      #@user.save
    end
    it "emailに＠を含まない場合に新規登録できない" do
      user = User.new(nickname: "abe", email: "aaabbb", encrypted_password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "encrypted_passwordが空の場合に新規登録できない" do
      user = User.new(nickname: "abe", email: "aaabbb", encrypted_password: "", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Encrypted password is not included in the list")
    end
    it "encrypted_passwordが6文字以上でない場合新規登録できない" do
      user = User.new(nickname: "abe", email: "aaa@bbb", encrypted_password: "hori3")
      user.valid?
      expect(user.errors.full_messages).to include("Encrypted password is too short (minimum is 6 characters)")
    end
    it "encrypted_passwordが半角英数字混合出ない場合に新規登録できない" do
      user = User.new(nickname: "abe", email: "aaa@bbb",encrypted_password: "aaabbcc")
      user.valid?
      expect(user.errors.full_messages).to include("Encrypted password is not included in the list")
    end
    it "encrypted_passwordが確認を含めて２回入力していない場合に新規登録できない" do
    end
    it "ユーザー本名が全角で入力されてない場合に新規登録できない" do
    end
    it "ユーザー本名の名字と名前が入力されてない場合に新規登録できない" do
    end
    it "ユーザー本名のフリガナが全角で入力されてない場合に新規登録できない" do
    end
    it "ユーザー本名のフリガナの名字と名前が入力されてない場合に新規登録できない" do
    end
    it "生年月日が入力されてない場合に新規登録ができない" do
    end
  end
end
