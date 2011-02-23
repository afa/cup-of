class Section < ActiveRecord::Base
 has_many :products

 belongs_to :parent, :class_name => 'Section', :foreign_key => :parent_id
 has_many :children, :class_name => 'Section', :foreign_key => :parent_id
 has_attached_file :cover

 def slow_all_products
  self.children.where(:active=>true).inject(self.products.where(:active=>true)){|prods, child| prods + child.all_products }.sort{|a, b| a.priority? && b.priority? ? ( - (a.priority <=> b.priority)) : ( b.priority.nil? && a.priority.nil? ? 0 : (a.priority? ? -1 : 1) ) } 
 end

 def all_products
  Product.where(:section_id => self.tree_to_list.map(&:id))
 end

 def tree_to_list
  self.class.subtree_by_levels([self])
 end

 def self.subtree_by_levels(arr)
  return [] if arr.empty?
  arr | self.subtree_by_levels(self.where(:parent_id => arr.map(&:id)))
 end
end
