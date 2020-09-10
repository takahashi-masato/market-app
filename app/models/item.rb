class Item < ApplicationRecord
  has_many :images,dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id
  #sellerでクラスを指定。値を取り出す場合はここを使う。
  # accepts_nested_attributes_for :images
  # is_impressionable
end
