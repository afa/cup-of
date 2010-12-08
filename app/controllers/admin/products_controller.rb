class Admin::ProductsController < ApplicationController
  before_filter :get_products

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def create
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
end
