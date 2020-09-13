class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :category_id, null: false, foreign_key: true
      t.string :brand_name
      t.string :item_condition, null: false
      t.string :shipping_payer, null: false
      t.string :shipping_from_area, null: false
      t.string :shipping_duration, null: false
      t.string :price, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
