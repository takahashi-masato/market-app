class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id
  #sellerでクラスを指定。値を取り出す場合はここを使う。
  # accepts_nested_attributes_for :images
  # is_impressionable
  validates :name,:description,:brand_name,:item_condition,:shipping_payer,:shipping_from_area,:shipping_duration,:price,:seller_id, presence: true
  validates :image_ids, presence: { message: "画像を選択してください" }
end
