class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :identification
  has_one :deliver_address

  validates :nickname, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  has_many :items,foreign_key: :seller_id, dependent: :destroy
end
