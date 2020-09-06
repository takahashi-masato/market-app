class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :identification
  has_one :deliver_address
  has_many :items,foreign_key: :seller_id, dependent: :destroy

  validates :nickname, presence: true, uniqueness: true

end
