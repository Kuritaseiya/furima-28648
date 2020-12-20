class Form 
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:municipality,:number,:phone_number,:building_name,:building_name,:buy_id,:user_id,:item_id,:token

  with_options presence: true do
    validates  :postal_code
    validates  :prefecture_id
    validates  :municipality
    validates  :number
    validates  :phone_number
    validates  :token
    validates  :user_id
    validates  :item_id

  end

  validates  :prefecture_id,numericality: { other_than: 1 }
  validates  :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates  :phone_number, numericality: {only_integer: true}
  validates  :phone_number,length: { in: 10..11 }
  validates  :phone_number, exclusion: { in: %w( - ) }


  def save
    buy = Buy.create!(item_id: item_id,user_id: user_id)
    Live.create!(postal_code: postal_code,prefecture_id: prefecture_id,municipality: municipality,number: number,phone_number: phone_number,building_name: building_name,buy_id: buy.id)
  end
end


