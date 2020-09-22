class CreateDeliverAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :deliver_addresses do |t|
      t.references :user,               null: false, foreign_key: true
      t.string     :family_name_kanji,  null: false
      t.string     :first_name_kanji,   null: false
      t.string     :family_name_kana,   null: false
      t.string     :first_name_kana,    null: false
      t.integer    :postal_code,        null: false
      t.string     :prefecture,         null: false
      t.string     :city,               null: false
      t.string     :address1,           null: false
      t.string     :address2
      t.string     :telephone,          unique: true
    end
  end
end
