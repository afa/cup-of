namespace :repair do
task :repaper => :environment do
 Product.where("cover_file_name is not null").all.each{|p| p.cover.reprocess! if p.cover_file_name? }
end
end
