class SectionsController < ApplicationController
  def show
   @section = Section.find(params[:id])
   @products = @section.all_products.paginate(:page=>(params[:page] || 1), :per_page=>20) if @section
  end

  def index
  end

end
