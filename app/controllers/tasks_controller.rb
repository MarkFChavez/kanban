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
    @task = @project.tasks.find(params[:id])
    @task.destroy

    redirect_to @project, notice: t('delete-task-success')
  end

  def get_project
    @project = current_user.projects.find(params[:project_id])
  end

  def change_status
    @task = @project.tasks.find(params[:id])
    @action = params[:act]

    if !@action.nil?
      @task.status = @action
      if @task.save 
        redirect_to @project, notice: t('change-status-success')
      else
        redirect_to @project, alert: t('change-status-error')
      end
    else
      redirect_to @project, alert: t('change-status-action-empty')
    end
  end
end
