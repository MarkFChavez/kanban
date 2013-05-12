class HomeController < ApplicationController

  before_filter :authenticate_user!, only: :show

  def index
  	redirect_to dashboard_path if user_signed_in?
  end

  def show
  	#get number of projects
  	@projects_count = current_user.projects.size
  end
end
