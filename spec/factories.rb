Factory.sequence :section_name do |n|
 "section_#{n}"
end
Factory.define :section do |s|
 s.name { Factory.next(:section_name) }
end
