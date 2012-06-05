source 'http://rubygems.org'

gem 'rails', '3.0.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

gem "rb-readline", :require => "readline"
# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
# gem "rake", "0.8.7"
 gem 'capistrano'
 gem "haml-rails"
 gem "sass"
 gem "andand"
 gem "haml"
 gem "paperclip"
 #gem "paperclip", "2.3.3"
 gem "devise"
 gem "cancan"
# gem "will_paginate", :git=>"https://github.com/mislav/will_paginate.git", :branch=>"rails3"
 gem "will_paginate", "~>3.0.pre2"
 gem "hpricot"
 gem "ruby_parser"
 gem "sanitize"
 gem "jquery-rails"
 gem "nokogiri"
 gem "cells"
# gem "clearance"

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
 group :development do
  gem "bullet", "~>2.0.0.beta.2"
 end
 group :development, :test do
  gem "factory_girl_rails", ">=1.1.rc1"
  gem "database_cleaner"
  gem "cucumber-rails", ">=0.3.2"
#  gem "cucumber"
  gem "rspec-rails"#, "~>2.6.0"
  gem "rspec-cells"
#  gem "rspec"
  #gem 'webrat', ">=0.7.2.beta.1"
  gem "capybara"
 end
 group :production do
  gem "newrelic_rpm"
  gem "dalli"
 end
