class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name, :null=>false
      t.text :description
      t.integer :section_id, :null=>false
      t.timestamps
    end
    add_index :products, :section_id
  end

  def self.down
    drop_table :products
  end
end
