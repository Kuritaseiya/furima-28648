require 'rails_helper'

RSpec.describe Live, type: :model do
  before do
    @live = FactoryBot.build(:live)
  end

  describe '商品登録：正常系' do
    it "全ての欄を埋めて指定された条件を満たしている時" do
      #expect(@live).to be_valid
    end
  end

  describe '商品登録:異常系' do
    it "郵便番号が空の場合" do
      @live.postal_code = ""
      @live.valid?
      binding.pry
      #expect(@live.errors.full_messages).to include("Buy must exist")
    end

    it "郵便番号にハイフンが入っていない場合" do
      #@live.postal_code = "1234567"
      #@live.valid?
      #expect(@live.errors.full_messages).to include("Buy must exist")
    end
    
    it "電話番号がからの場合" do
      #@live.phone_number = ""
      #@live.valid?
    end

  end
end
