class CartController < ApplicationController
  def new
  end

  def edit
  end

  def create
   if params[:product] and params[:amount]
    @cart << {:product_id=>params['product'], :amount=>params['amount']}
    c = []
    @cart.each{|item| c << [item[:product_id].to_i, item[:amount].to_i] }
    session[:cart] = c
   end
   redirect_to :back
  end

  def update
  end

  def destroy
  end

  def show
  end

  def index
  end
end
