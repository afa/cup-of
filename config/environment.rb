# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
CupOf::Application.initialize!

Haml::Template.options[:format] = :html5
