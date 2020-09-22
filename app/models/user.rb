class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :identification
  has_one :deliver_address
  has_many :items,foreign_key: :seller_id, dependent: :destroy
  accepts_nested_attributes_for :identification
  accepts_nested_attributes_for :deliver_address

  validates :nickname, presence: true, uniqueness: true

  VALID_EMAIL_REGEX = /\A([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6})*\z/
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}

  has_many :items,foreign_key: :seller_id, dependent: :destroy
  has_many :cards

  

end
