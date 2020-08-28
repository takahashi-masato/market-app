class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images

  belongs_to :user
  is_impressionable
end
