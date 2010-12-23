class AddPosToProducts < ActiveRecord::Migration
  def self.up
   add_column :sections, :active, :boolean
   add_column :products, :priority, :integer
   Section.update_all "active = 't'"
  end

  def self.down
   remove_column :sections, :active
   remove_column :products, :priority
  end
end
