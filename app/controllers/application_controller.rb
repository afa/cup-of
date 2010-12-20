class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_m_items
  before_filter :load_cart

 protected
  def get_m_items
   @m_items = Product.order('random()').limit(6)
  end

  def load_cart
   @cart = (session[:cart] || []).map{|item| {:product_id => item[0], :amount => item[1]}}
  end
end
