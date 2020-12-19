require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)
    @form = FactoryBot.build(:form, user_id: user.id , item_id: item.id)
  end

  describe '商品登録：正常系' do
    it "全ての欄を埋めて指定された条件を満たしている時" do
      expect(@form).to be_valid
    end

    it "建物名がなくても保存ができる" do
      @form.building_name = ""
      expect(@form).to be_valid
    end
  end

  describe '商品登録:異常系' do
    it "郵便番号が空の場合" do
      @form.postal_code = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("Postal code can't be blank")
    end

    it "郵便番号にハイフンが入っていない場合" do
      @form.postal_code = "1234567"
      @form.valid?
      expect(@form.errors.full_messages).to include("Postal code is invalid")
    end
    
    it "電話番号が空の場合" do
      @form.phone_number = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号が12桁以上の場合" do
      @form.phone_number = "090112233445"
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end

    it "電話番号にハイフンが入っている場合" do
      @form.phone_number = "090-1122-3344"
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number is not a number")
    end

    it "都道府県が空の場合" do
      @form.prefecture_id = 1
      @form.valid?
      expect(@form.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "市区町村が空の場合" do
      @form.municipality = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("Municipality can't be blank")
    end

    it "番地が空の場合" do
      @form.number = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("Number can't be blank")
    end

    it "tokenが空の場合" do
      @form.token = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("Token can't be blank")
    end

    it "user_idがないと登録ができない" do
      @form.user_id = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("User can't be blank")
    end

    it "item_idがないと登録できない" do
      @form.item_id = ""
      @form.valid?
      expect(@form.errors.full_messages).to include("Item can't be blank")
    end

  end
end