class AddSurnameToPurchase < ActiveRecord::Migration
  def self.up
   add_column :purchases, :u_surname, :string
  end

  def self.down
   remove_column :purchases, :u_surname
  end
end
