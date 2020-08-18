class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to index_path
  end

  private

  # STRONG PARAMS
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
#   # FILTER (Execute set_restaurant method)
#   before_action :set_restaurant, only: [:show, :edit, :update, :destroy]


#   # DESTROY (DELETE) /restaurants/:id
#   def destroy
#     @restaurant.destroy
#     redirect_to @restaurants_path
#   end

#

#   # BEFORE ACTION FILTER
#   def set_restaurant
#     @restaurant = Restaurant.find(params[:id])
#   end
# end
