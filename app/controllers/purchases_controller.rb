class PurchasesController < ApplicationController
 before_filter :get_purchase, :only => :show

  def create
   if user_signed_in?
    purchase = current_user.purchases.cart_items.create params[:purchase]
    if purchase
     @cart.each{|item| purchase.create item }
     @cart = []
     session[:cart] = []
     UserNotification.purchase_created(purchase).deliver
    else
     redirect_to :back
    end
   else
    purchase = Purchase.create params[:purchase]
    if purchase
     @cart.each{|item| purchase.cart_items.create item }
     @cart = []
     session[:cart] = []
     UserNotification.purchase_created(purchase).deliver
    else
     redirect_to :back
    end
   end
   redirect_to purchase_path(purchase.id)
  end

  def show
  end

 protected
  def get_purchase
   @purchase = Purchase.find(params[:id])
  end
end
