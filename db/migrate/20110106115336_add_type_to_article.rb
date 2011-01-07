class AddTypeToArticle < ActiveRecord::Migration
  def self.up
   add_column :articles, :type, :string
  end

  def self.down
   remove_column :articles, :type
  end
end
