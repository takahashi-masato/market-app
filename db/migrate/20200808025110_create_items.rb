class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name 
      t.text :description 
      t.string :brand_name
      t.string :item_condition
      t.string :shipping_payer 
      t.string :shipping_from_area
      t.string :shipping_duration 
      t.integer :price
      t.integer  :user_id 
      t.timestamps
    end
  end
end
