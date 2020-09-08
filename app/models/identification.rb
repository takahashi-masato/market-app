class Identification < ApplicationRecord
  belongs_to :user

  validates :family_name_kanji, presence: true
end
