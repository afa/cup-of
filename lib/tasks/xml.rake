require "nokogiri"
namespace :xml do
 desc "load from wg"
 task "load" => :environment do
  `#{WGET_PATH} ftp://#{WG_USER}:#{WG_PASS}@#{WG_PREFIX}catalog.xml -q -nc -P /home/hosting_cup-of/xml`
  `#{WGET_PATH} ftp://#{WG_USER}:#{WG_PASS}@#{WG_PREFIX}offers.xml -q -nc -P /home/hosting_cup-of/xml`
 end
 namespace :process do
  desc "import from xml in-store values"
  task :in_store => :environment do
   fl1 = File.join(XML_BASE, "1000_catalog.xml")
   fl2 = File.join(XML_BASE, "1000_offers.xml")
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
   fnd = 0
   nfnd = 0
   store.each do |key, val|
    products = Product.where(:artikul=>val[:art].strip).all
    products = Product.where(:name=>val[:name].strip).all if products.empty?
    if products.empty?
     nm = val[:name].gsub(/\s*\(*Gutenberg\)*\s*/u, ' ').strip
     products = Product.where(:name=>nm).all
    end
    if products.empty?
     nfnd += 1
     #puts "not found #{nm}"
     next
    end
    if val.has_key?(:count)
     if val[:count].to_i > 0
      products.each{|p| p.update_attributes :in_store => true }
     else
      products.each{|p| p.update_attributes :in_store => false }
     end
    end
    fnd += 1
   end
   #puts "found #{fnd}, not #{nfnd}"
  end
 end
end
