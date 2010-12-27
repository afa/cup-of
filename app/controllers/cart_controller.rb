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
   if params[:product] and params[:amount]
    @cart = @cart.select{|i| not (i[:product_id].to_i == params[:product].to_i and i[:amount].to_i == params[:amount].to_i) }
    c = []
    @cart.each{|item| c << [item[:product_id].to_i, item[:amount].to_i] }
    session[:cart] = c
   end
   redirect_to :back
  end

  def show
  end

  def index
   if current_user
    @purchase = current_user.purchases.new
   else
    @purchase = Purchase.new
   end
  end
end
