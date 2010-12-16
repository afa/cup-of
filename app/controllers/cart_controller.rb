class CartController < ApplicationController
 before_filter :get_cart
  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
  end

  def index
  end
 protected
  def get_cart
   @cart = session[:cart]
  end
end
