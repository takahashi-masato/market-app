class RenameRequestColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :user_id, :seller_id
  end
end
