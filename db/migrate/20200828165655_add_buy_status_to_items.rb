class AddBuyStatusToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :buy_status, :integer
    add_column :items, :buyer_id, :integer
  end
end
