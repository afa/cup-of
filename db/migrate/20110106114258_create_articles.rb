class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :name
      t.text :body
      t.string :pic_file_name
      t.integer :pic_file_size
      t.string :pic_content_type
      t.boolean :active
      t.boolean :on_main
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
