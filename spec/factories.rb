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

Factory.define :discount do |d|
 d.start_at { 1.days.ago }
 d.stop_at { 1.day.from_now }
end

Factory.sequence :user_mail do |n|
 "u_#{n}@example.com"
end
Factory.define :user do |u|
 u.email { Factory.next(:user_mail) }
 u.password { Factory.next(:user_mail) }
end
