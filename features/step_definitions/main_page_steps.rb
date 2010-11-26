Given /^I am viewing main page$/ do
 visit '/'
end

Given /^I can see link to tea main$/ do
 response.should have_selector('a', :href=>tea_root_path)
end

Given /^link contain tea image$/ do
 response.should have_selector('a', :href=>tea_root_path) do |c|
  c.should have_selector('img')#, :src=>/\/images\/main-cup-of-tea.jpg/)
 end
end

When /^I click link to tea$/ do
 click_link 'tea_main'
end

Then /^I visit tea main page$/ do
 #response.should be_success
 current_url.should =~ /#{tea_root_path}/
end
Given /^I can see link to coffee main$/ do
 response.should have_selector('a', :href=>coffee_root_path)
end

Given /^link contain coffee image$/ do
 response.should have_selector('a', :href=>coffee_root_path) do |c|
  c.should have_selector('img')#, :src=>/main-cup-of-coffee.jpg/)
 end
end

When /^I click link to coffee$/ do
 click_link "coffee_main"
end

Then /^I visit coffee main page$/ do
 current_url.should =~ /#{coffee_root_path}/
end

