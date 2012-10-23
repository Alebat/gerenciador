class HomeController < ApplicationController
  def index
    load_projects if user_signed_in?
  end
end
