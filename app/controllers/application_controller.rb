class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_m_items

 protected
  def get_m_items
   @m_items = Product.order('random()').limit(6)
  end
end
