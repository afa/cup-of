class CartItem < ActiveRecord::Base
 belongs_to :product
 belongs_to :purchase
end
