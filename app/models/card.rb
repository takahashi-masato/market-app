class Card < ApplicationRecord
  has_one :user

  validates :card_id, presence: true
  validates :customer_id, presence: true
  validates :user_id, presence: true
end
