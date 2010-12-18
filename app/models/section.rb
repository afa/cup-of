class Section < ActiveRecord::Base
 has_many :products

 belongs_to :parent, :class_name => 'Section', :foreign_key => :parent_id
 has_many :children, :class_name => 'Section', :foreign_key => :parent_id
 has_attached_file :cover
end
