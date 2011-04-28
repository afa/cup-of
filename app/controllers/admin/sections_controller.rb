class Admin::SectionsController < Admin::ApplicationController
  before_filter :get_sections, :only=>[:index]
  before_filter :get_section, :only=>[:show, :edit, :update]
  before_filter :new_section, :only=>[:new, :create]


  def index
  end

  def show
  end

  def edit
  end

  def update
   if @section.update_attributes(params[:section])
    redirect_to admin_sections_path
   else
    render :edit
   end

  end

  def new
  end

  def create
   if Section.create(params[:section])
    redirect_to admin_sections_path
   else
    render :new
   end

  end
 protected
  def get_sections
   @sections = Section.order("id").all
  end

  def get_section
   @section = Section.find(params[:id])
  end

  def new_section
   @section = Section.new
  end


end
