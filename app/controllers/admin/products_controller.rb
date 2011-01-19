class Admin::ProductsController < ApplicationController
  before_filter :get_products, :only=>[:index]
  before_filter :get_product, :only=>[:show, :edit, :update]
  before_filter :new_product, :only=>[:new, :create]

  def index
  end

  def show
  end

  def edit
  end

  def update
   if @product.update_attributes(params[:product])
    redirect_to admin_products_path
   else
    render :edit
   end
  end

  def create
   if Product.create(params[:product])
    redirect_to admin_products_path
   else
    render :new
   end
  end

  def new
  end

 protected
  def get_products
   @products = Product.order("id desc").all
  end

  def get_product
   @product = Product.find(params[:id])
  end

  def new_product
   @product = Product.new
  end
end
