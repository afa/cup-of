class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.integer :user_id
      t.string :u_name
      t.string :u_mail
      t.string :u_phone
      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
