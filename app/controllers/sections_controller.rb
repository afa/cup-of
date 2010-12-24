class SectionsController < ApplicationController
  def show
   @section = Section.find(params[:id])
   if @section
    @products = @section.all_products.paginate(:page=>params[:page] || 1, :per_page=>20)
    @children = @section.children.where(:active=>true).order("position nulls last")
   end
  end

  def index
  end

end
