Given /^I am$/ do
end

When /^I am view main tea page$/ do
 visit tea_root_path
 #response.should be_success
end

Then /^I can view link to coffee main with coffee\-cup image$/ do
 within "#heading" do |hd|
  hd.should have_selector('a', :href=>coffee_root_path) do |a|
   a.should have_selector('img')
  end
 end
end

Then /^I can view contacts link with phone and phone image$/ do
 within "#heading" do |hd|
  hd.should have_selector('a', :href=>contacts_path) do |a|
   a.should have_selector('img')
  end
 end
end

Then /^I can view mail\-to link with email env image$/ do
 within "#heading" do |hd|
  hd.should have_selector('a', :href=>'mailto:') do |a|
   a.should have_selector('img')
  end
 end
end

Then /^I can view tea\-cup image$/ do
 within '#heading' do |hd|
  hd.should have_selector('img', :alt=>'Cup-ul-1')
#('img', :src=>image_path('cup-ul-1.jpg'))
 end
end

