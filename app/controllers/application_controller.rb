class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_m_items
  before_filter :load_cart

  rescue_from CanCan::AccessDenied do |exception|
   flash[:alert] = exception.message
   redirect_to root_url
  end

 protected
  def get_m_items
   @m_items = Product.where(:active=>true).order('random()').limit(6)
  end

  def load_cart
   @cart = (session[:cart] || []).map{|item| {:product_id => item[0], :amount => item[1]}}
   @cart_sum = @cart.inject(0.0){|sum, i| sum + (Product.find(i[:product_id]).andand.price || 0.0) * (i[:amount] || 0) }
  end
end
