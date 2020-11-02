class User < ApplicationRecord
  has_many :item_id
  has_one :bay_id
