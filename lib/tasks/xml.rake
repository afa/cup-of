require "nokogiri"
namespace :xml do
 namespace :process do
  desc "import from xml in-store values"
  task :in_store => :environment do
   fl1 = File.join(XML_BASE, "WG_catalog.xml")
   fl2 = File.join(XML_BASE, "WG_offers.xml")
   doc = Nokogiri::XML(File.open(fl1, 'r'))
   encoding = doc.encoding
   store = {}
   doc.xpath("//Товары/Товар").each do |item|
    nm = item.xpath("Наименование").first.content
    id = item.xpath("Ид").first.content
    art = item.xpath("ЗначенияСвойств/ЗначенияСвойства").select{|el| el.xpath("Ид").first.content == '1C_ARTIKUL' }.first
    art_val = art.xpath("Значение").first.content
    if store.has_key?(id)
     raise "dup #{id}"
    end
    store[id] = {:id => id, :name =>nm, :art => art_val}
   end
   doc2 = Nokogiri.XML(File.open(fl2, "r"))
   doc2.xpath("//ПакетПредложений/Предложения/Предложение").each do |item|
    id = item.xpath("Ид").first.content
    cnt = item.xpath("Количество").first.content
    unless store.has_key?(id)
     raise "not found #{id}"
    end
    if store[id].has_key?(:count)
     raise "dup2 #{id}"
    end
    store[id][:count] = cnt
   end
   storeids=[]
   store.each do |key, val|
    products = Product.where(:artikul=>val[:art].strip).all
    products = Product.where(:name=>val[:name].strip).all if products.empty?
    if products.empty?
     nm = val[:name].gsub(/\s*\(*Gutenberg\)*\s*/u, ' ').strip
     puts "try #{nm}"
    end
   end
  end
 end
end
