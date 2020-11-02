class Item < ApplicationRecord
  brlongs_to :user_id
  has_one :live_id
  has_one :bay_id
  