class Product < ActiveRecord::Base
 scope :tea, where(:section=>Section.find_by_name('Tea'))
 scope :coffee, where(:section=>Section.find_by_name('Coffee'))

 belongs_to :section

 has_attached_file :cover
 # размеры картинок уточнить
end
