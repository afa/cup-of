class CreateDiscounts < ActiveRecord::Migration
  def self.up
    create_table :discounts do |t|
      t.string :name, :nil => false
      t.datetime :start_at, :nil => false
      t.datetime :stop_at, :nil => false
      t.float :multiplier
      t.float :fixed_part
      t.timestamps
    end
    create_table :discounts_users, :id => false do |t|
     t.integer :discount_id, :nil => false
     t.integer :user_id, :nil => false
    end
    create_table :discounts_products, :id => false do |t|
     t.integer :discount_id, :nil => false
     t.integer :product_id, :nil => false
    end
    create_table :discounts_sections, :id => false do |t|
     t.integer :discount_id, :nil => false
     t.integer :section_id, :nil => false
    end
    add_index :discounts_sections, [:discount_id]
    add_index :discounts_products, [:discount_id]
    add_index :discounts_users, [:discount_id]
    add_index :discounts_sections, [:section_id]
    add_index :discounts_products, [:product_id]
    add_index :discounts_users, [:user_id]
  end

  def self.down
    drop_table :discounts_users
    drop_table :discounts_products
    drop_table :discounts_sections
    drop_table :discounts
  end
end
