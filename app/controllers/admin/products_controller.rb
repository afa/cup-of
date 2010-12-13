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
   @products = Product.all
  end

  def get_product
   @product = Product.find(params[:id])
  end

  def new_product
   @product = Section.find_by_name('Tea').products.new
  end
end
