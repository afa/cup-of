class Product < ActiveRecord::Base
 scope :tea, where(:section=>Section.find_by_name('Tea'))
 scope :coffee, where(:section=>Section.find_by_name('Coffee'))

 belongs_to :section

 has_attached_file :cover, :styles=>{:tiny=>["72x72<", :jpg], :small=>["144x144<", :jpg], :medium=>["300x300<", :jpg]}
 # размеры картинок уточнить
end
