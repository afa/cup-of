FactoryGirl.define do
 sequence :section_name do |n|
  "section_#{n}"
 end

 factory :section do
  active true
  name { Factory.next(:section_name) }
 end

 sequence :product_name do |n|
  "product_#{n}"
 end
 factory :product do
  active {true}
  name { Factory.next(:product_name) }
 end

 factory :discount do
  start_at { 1.days.ago }
  stop_at { 1.day.from_now }
 end

 sequence :user_mail do |n|
  "u_#{n}@example.com"
 end
 factory :user do
  email { Factory.next(:user_mail) }
  username { email.to_s.gsub("@", '_') }
  password { Factory.next(:user_mail) }
  password_confirmation { password }
  factory :admin do
   username "kat"
  end
 end

 sequence :article_name do |n|
  "art_#{n}"
 end
 sequence :article_body do |n|
  "article body lost somwhere in text indexed #{n}."
 end
 factory :article do
  name { Factory.next :article_name }
  body { Factory.next :article_body }
  active { true }
 end
end
