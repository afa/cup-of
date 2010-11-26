# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101101123349) do

  create_table "products", :force => true do |t|
    t.string   "name",               :null => false
    t.text     "description"
    t.integer  "section_id",         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_file_name"
    t.integer  "cover_file_size"
    t.string   "cover_content_type"
    t.datetime "cover_updated_at"
  end

  add_index "products", ["section_id"], :name => "index_products_on_section_id"

  create_table "sections", :force => true do |t|
    t.string   "name",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_file_name"
    t.integer  "cover_file_size"
    t.string   "cover_content_type"
    t.datetime "cover_updated_at"
  end

  create_table "things", :force => true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.integer  "thingable_id"
    t.string   "type"
    t.string   "thingable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
