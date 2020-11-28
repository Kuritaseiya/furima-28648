require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能：正常系' do
    it "全ての欄を埋めて指定された条件を満たしている時" do
      expect(@item).to be_valid
    end
  end

  describe '商品出品機能:異常系' do
    it "nameが空の場合、出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "explanationが空の場合、出品できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it "category_idが1の場合は出品できない" do
      @item.genre_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Genre must be other than 1")
    end

    it "priceは半角数字のみ入力ができること" do
      @item.price = "５００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceは300~9,999,999の間までしか数字を入力できない" do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price must be greater than or equal to 300")
    end

    it "priceは300~9,999,999の間までしか数字を入力できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price must be less than or equal to 9999999")
    end

    it "product_condition_idが1の場合は出品できない" do
      @item.product_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include( "Product condition must be other than 1")
    end

    it "delivery_fee_idが1の場合は出品できない" do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include(  "Delivery fee must be other than 1")
    end

    it "prefecture_idが1の場合は出品できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "guideline_idが1の場合は出品できない" do
      @item.guideline_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include( "Guideline must be other than 1")
    end

    it "商品画像が添付されていない場合、出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include( "Image can't be blank")
    end

  end
end
