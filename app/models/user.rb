class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buys

  validates :nickname, presence: true 
  validates :email, presence: true 
  validates :email, uniqueness: true 
  validates :email, inclusion: {in: %w(@)} 
  validates :encrypted_password, length: {minimum: 6} 
  validates :encrypted_password, inclusion: { in: %w(/\A[a-z A-Z 0-9]\z/) }
  validates :name, inclusion: { in: %w(/\A(?:\p{Hiragana}|\p{Katakana}|[--]|[--龠々])+\z/)}
end
