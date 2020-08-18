class AddStockToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :stock, :integer
  end
end
