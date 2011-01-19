class Product < ActiveRecord::Base

 belongs_to :section
 validates_presence_of :name, :blank=>false

 has_attached_file :cover, :styles=>{:tiny=>["72x72>", :jpg], :small=>["144x144>", :jpg], :medium=>["300x300>", :jpg], :mord=>["96x96", :jpg]}
 # размеры картинок уточнить
end
