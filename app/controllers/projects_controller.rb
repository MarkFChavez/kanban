class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = current_user.projects.find(params[:id])
    @task = @project.tasks.new
    @presenter = TaskPresenters::ShowPresenter.new(@project)
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.build(params[:project])

    if @project.save
      redirect_to dashboard_path, notice: t('create-project-success')
    else
      redirect_to new_project_path, alert: t('create-project-error')
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy

    redirect_to dashboard_path, notice: t('delete-project-success')
  end
end
