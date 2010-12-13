class AddActiveToProdict < ActiveRecord::Migration
  def self.up
   add_column :products, :active, :boolean, :default => false
   add_column :products, :short_descr, :text
  end

  def self.down
   remove_column :products, :active
   remove_column :products, :short_descr
  end
end
