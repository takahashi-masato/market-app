class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  is_impressionable
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id
  #sellerでクラスを指定。値を取り出す場合はここを使う。
end
