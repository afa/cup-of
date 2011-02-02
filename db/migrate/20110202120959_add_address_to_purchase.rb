class AddAddressToPurchase < ActiveRecord::Migration
  def self.up
    add_column :purchases, :address, :text
    add_column :purchases, :comment, :text
  end

  def self.down
    remove_column :purchases, :comment
    remove_column :purchases, :address
  end
end
