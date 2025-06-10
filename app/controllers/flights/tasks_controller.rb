class Flights::TasksController < ApplicationController
  def index
    @flight = Flight.find(params[:flight_id])
    @tasks = Task.where(taskable: @flight)
    @tasks_grouped = @tasks.group_by(&:category)
    @task = Task.new

  end

  def create
    @task = Task.new(task_params)
    @flight = Flight.find(params[:flight_id])
    @task.taskable = @flight

    if @task.save
      if task_params[:add_to_user_list] == "1"
        new_user_task = Task.new(content: task_params[:content], category_id: task_params[:category_id])
        new_user_task.taskable = current_user
        new_user_task.save
      end
      redirect_to flight_tasks_path(@flight)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:category_id, :content, :add_to_user_list)
  end
end
