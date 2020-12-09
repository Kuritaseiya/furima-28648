class Buy < ApplicationRecord
  include ActiveModel::Model
  attr_accessor  :user, :item

  belongs_to  :user
  belongs_to  :item

  with_options presence: true do
    validates :item
    validates :user
  end

  def save 
    @user.save
    @item.save
  end
end
