class ProductsController < ApplicationController
  def index
  end

  def show
   @product = Product.find(params[:id])
   @meta = {}
   @meta[:title] = @product.meta_title unless @product.meta_title.blank?
   @meta[:description] = @product.meta_description unless @product.meta_description.blank?
   @meta[:keywords] = @product.meta_keywords unless @product.meta_keywords.blank?
  end

end
