class TasksController < ApplicationController
  before_action :set_restaurant, except: [:index, :new, :create]

  def edit
  end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

   def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def update
    @task.update(task_params)
    redirect_to task_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

private

  def set_restaurant
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :duration)
  end


end
