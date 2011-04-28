class Admin::DiscountsController < Admin::ApplicationController
  before_filter :get_discounts, :only => [:index]
  before_filter :get_discount, :only => [:show, :edit, :update]

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

 protected
  def get_discounts
   @discounts = Discount.all
  end

  def get_discount
   @discount = Discount.find(params[:id])
  end
end
