class ProjectsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.build(params[:project])

    if @project.save
      redirect_to dashboard_path, notice: t('create-project-success')
    else
      redirect_to new_projects_path, alert: t('create-project-error')
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
