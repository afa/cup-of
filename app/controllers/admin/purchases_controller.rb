class Admin::PurchasesController < ApplicationController
 before_filter :get_purchase, :only => [:show]
 before_filter :get_purchases, :only => [:index]
  def index
  end

  def show
  end

 protected
  def get_purchase
   @purchase = Purchase.find(params[:id])
  end

  def get_purchases
   @purchases = Purchase.all
  end
end
