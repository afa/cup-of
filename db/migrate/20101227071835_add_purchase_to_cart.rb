class AddPurchaseToCart < ActiveRecord::Migration
  def self.up
   add_column :cart_items, :purchase_id, :integer
  end

  def self.down
   remove_column :cart_items, :purchase_id
  end
end
