class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item
  #validates :image, presence: true: { message: "出力されるメッセージ" }

end
