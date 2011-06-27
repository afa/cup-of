class AddPageTitleToProducts < ActiveRecord::Migration
  def self.up
   add_column :products, :meta_title, :string
   add_column :products, :meta_description, :string
   add_column :products, :meta_keywords, :string
   add_column :sections, :meta_title, :string
   add_column :sections, :meta_description, :string
   add_column :sections, :meta_keywords, :string
  end

  def self.down
   remove_column :products, :meta_title
   remove_column :products, :meta_description
   remove_column :products, :meta_keywords
   remove_column :sections, :meta_title
   remove_column :sections, :meta_description
   remove_column :sections, :meta_keywords
  end
end
