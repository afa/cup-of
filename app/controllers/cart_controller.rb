class CartController < ApplicationController


  def new
  end

  def edit
  end

  def create
   if params[:product] and params[:amount]
    found, nonfound = @cart.partition{|i| i[:product_id] == params[:product] }
    @cart << {:product_id=>params['product'], :amount=>params['amount']}
    c = []
    @cart.each{|item| c << [item[:product_id].to_i, item[:amount].to_i] }
    session[:cart] = c
   end
   respond_to do |format|
    format.html {redirect_to :back}
    format.js {
     load_cart
     render :update do |page|
      page["#product_notice_#{params[:product]}"].html("<span style=\"color:green;font-size:10px;\">Отправлено в корзину</span>")
      page["#cart_size"].html(@cart.size.to_s)
      page["#cart_amount"].html(@cart_sum.to_s)
     end
    }
   end
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
