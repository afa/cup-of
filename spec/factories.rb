Factory.sequence :section_name do |n|
 "section_#{n}"
end
Factory.define :section do |s|
 s.active {true}
 s.name { Factory.next(:section_name) }
end
Factory.sequence :product_name do |n|
 "product_#{n}"
end
Factory.define :product do |s|
 s.active {true}
 s.name { Factory.next(:product_name) }
end
