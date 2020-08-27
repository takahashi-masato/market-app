class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images
  is_impressionable
end
