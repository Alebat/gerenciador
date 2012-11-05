class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
   flash[:error] = "Access denied."
   redirect_to root_url  
  end

  protected
  def load_projects
    @projects_admin = current_user.projects
    @projects_collaborate = current_user.collaborate_projects
  end
end
