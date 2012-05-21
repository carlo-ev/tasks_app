class TasksController < ApplicationController
  def index
	@tasks = Task.all
  end

  def show
	@task = Task.find(params[:id])
  end

  def create
	@task = Task.new(params[:task])
	if @task.save
		redirect_to @task
	end
  end

  def new
	@task = Task.new
  end

  def update
	@task = Task.find(params[:id])
	@task.description, @task.priority = params[:task][:description], params[:task][:priority]
	if @task.save
		redirect_to tasks_path
	end
  end

  def edit
	@task = Task.find(params[:id])
  end

  def destroy
	Task.find(params[:id]).try(:delete)
	redirect_to tasks_path
  end
end
