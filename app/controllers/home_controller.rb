class HomeController < ApplicationController

  PER_PAGE = 3

  before_filter :authenticate_user!, only: :show

  def index
  	redirect_to dashboard_path if user_signed_in?
  end

  def show
  	#get latest projects
  	@new_projects = current_user.projects.recent.paginate(page: params[:page], per_page: PER_PAGE)

  	#get number of projects
  	@projects_count = current_user.projects.size
  end
end
