class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buys

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  validates :email, format: { with:/@/}
  validates :password, length: {minimum: 6} 
  validates :password, format: { with: /\A[a-z A-Z 0-9]+\z/ }
  validates :password, presence: true

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/, message: 'Full-width characters' } do
    validates :name
    validates :last_name
  end

  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/}do
    validates :kana_name
    validates :kana_last_name
  end

end
