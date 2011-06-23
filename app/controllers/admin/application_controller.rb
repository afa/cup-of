class Admin::ApplicationController < ActionController::Base
  protect_from_forgery
  layout "admin/application"
  
  rescue_from CanCan::AccessDenied do |exception|
   #flash[:alert] = exception.message
   redirect_to root_url, :alert=>exception.message
  end

  before_filter :auth


 protected
  def auth
   authorize!(:manage, :all)
  end
end
