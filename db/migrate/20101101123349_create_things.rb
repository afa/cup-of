class CreateThings < ActiveRecord::Migration
  def self.up
    create_table :things do |t|
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.integer :thingable_id
      t.string :type
      t.string :thingable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :things
  end
end
