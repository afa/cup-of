class SectionsController < ApplicationController
  def show
   @section = Section.find(params[:id])
   @products = @section.products if @section
  end

  def index
  end

end
