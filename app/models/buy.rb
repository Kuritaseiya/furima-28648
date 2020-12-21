class Buy < ApplicationRecord
  has_one  :live, dependent: :destroy
  belongs_to  :item
end
