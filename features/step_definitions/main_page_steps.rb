Given /^I am viewing main page$/ do
 Factory(:section, :name => 'Tea',  :title => 'Чай')
 visit '/'
end

