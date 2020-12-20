class Buy < ApplicationRecord
  has_one  :live
  belongs_to  :item
end
