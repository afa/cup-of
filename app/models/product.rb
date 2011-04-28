class Product < ActiveRecord::Base

 belongs_to :section
 has_and_belongs_to_many :discounts
 validates_presence_of :name, :blank=>false

 has_attached_file :cover, :styles=>{:tiny=>["72x72>", :jpg], :small=>["144x144>", :jpg], :medium=>["300x300>", :jpg], :mord=>["96x96", :jpg]}
 # размеры картинок уточнить

 def current_price(user = nil)
  Discount.current(self, user).inject(price){|r, discount| r * discount.multiplier + discount.fixed_part.to_f }
 end
end
