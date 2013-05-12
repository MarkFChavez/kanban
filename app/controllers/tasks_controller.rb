class TasksController < ApplicationController

  before_filter :get_project, except: [:index, :new]
  before_filter :authenticate_user!

  def index
  end

  def show
  end

  def new
  end

  def create
    @task = @project.tasks.build(params[:task])

    if @task.save
      redirect_to @project, notice: t('create-task-success')
    else
      redirect_to @project, alert: t('create-task-error')
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def get_project
    @project = current_user.projects.find(params[:project_id])
  end
end
