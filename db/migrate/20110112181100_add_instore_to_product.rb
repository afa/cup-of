class AddInstoreToProduct < ActiveRecord::Migration
  def self.up
   add_column :products, :in_store, :boolean, :default=>true
   Product.update_all "in_store = 't'", "in_store is null"
  end

  def self.down
   remove_column :products, :in_store
  end
end
