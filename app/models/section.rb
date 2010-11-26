class Section < ActiveRecord::Base
 has_many :products

 has_attached_file :cover
end
