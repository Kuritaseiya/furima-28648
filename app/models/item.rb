class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user
  belongs_to :delivery_fee
  belongs_to :guideline
  belongs_to :prefecture
  belongs_to :product_condition
  has_one :buy, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :genre_id
    validates :product_condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :guideline_id
  end

  with_options numericality: { other_than: 1 } do
    validates :genre_id
    validates :product_condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :guideline_id
  end

  validates :price, numericality: {greater_than_or_equal_to: 300}   # 数字が300以上であるか
  validates :price, numericality: {less_than_or_equal_to: 9999999}      # 数字が9999999以下であるか
  #validates :prise, :format: { with: /\A[0-9]+\z/ }
end
