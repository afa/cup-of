class AddParentToSection < ActiveRecord::Migration
  def self.up
   add_column :sections, :parent_id, :integer
   add_column :sections, :position, :integer
   add_index :sections, [:parent_id]
   add_index :sections, [:position]
  end

  def self.down
   remove_column :sections, :parent_id
   remove_column :sections, :position
  end
end
