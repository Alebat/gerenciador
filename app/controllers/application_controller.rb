class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def load_projects
    @projects_admin = current_user.projects
    @projects_collaborate = current_user.collaborate_projects
  end
end
