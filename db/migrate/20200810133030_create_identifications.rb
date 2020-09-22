class CreateIdentifications < ActiveRecord::Migration[5.2]
  def change
    create_table :identifications do |t|
      t.integer :user_id,            null: false, foreign_key: true
      t.string  :family_name_kanji,  null: false
      t.string  :first_name_kanji,   null: false
      t.string  :family_name_kana,   null: false
      t.string  :first_name_kana,    null: false
      t.date    :birthday,           null: false
    end
  end
end
