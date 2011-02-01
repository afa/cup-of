class AddArtikulToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :artikul, :string
  end

  def self.down
    remove_column :products, :artikul
  end
end
