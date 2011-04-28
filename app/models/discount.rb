class Discount < ActiveRecord::Base
#
 has_and_belongs_to_many :products
 has_and_belongs_to_many :users
 has_and_belongs_to_many :sections

 scope :active_for_time, lambda{|ts| where("? between start_at and stop_at", ts) }
 scope :active_now, active_for_time(Time.now)
 scope :for_user, lambda{|u| joins(:users).where("discounts_users.user_id = ?", u.id) }
 scope :without_user, lambda{ joins("left outer join discounts_users on discounts.id=discounts_users.discount_id").where("discounts_users.user_id is null") }
 scope :for_product, lambda{|p| 
  sects = Section.parents_to_root([p].flatten.compact.map(&:section).compact.uniq)
  joins("inner join discounts_products on discounts.id=discounts_products.discount_id").where("discounts_products.product_id" => [p].flatten.compact.map(&:id)) | joins("inner join discounts_sections on discounts.id = discounts_sections.discount_id").where("discounts_sections.section_id" => sects.compact.map(&:id)) 
 }
 scope :for_section, lambda{|s| 
  sects = Section.parents_to_root([s].flatten.compact.uniq)
  joins(:sections).where("discounts_sections.section_id" => sects.map(&:id)) 
#"inner join discounts_sections on discounts.id = discounts_sections.discount_id"
 }

 def self.current(prod, user = nil)
  #ret discounts
  [user ? (active_now.for_user(user).order("multiplier desc nulls last, fixed_part asc nulls last").for_product(prod).first || active_now.for_user(user).order("multiplier desc nulls last, fixed_part asc nulls last").first) : nil, active_now.without_user.order("multiplier desc nulls last, fixed_part asc nulls last").for_product(prod).first].flatten.compact.uniq
 end
end
