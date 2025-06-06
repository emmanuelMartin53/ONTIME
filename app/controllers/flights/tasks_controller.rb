class Flights::TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.where(flight_id: [params[:flight_id], nil])
    @tasks_grouped = @tasks.group_by(&:category)
    @task = Task.new
    @flight = Flight.find(params[:flight_id])
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @flight = Flight.find(params[:flight_id])
    @task.flight = @flight
    if @task.save
      redirect_to flight_tasks_path(@flight)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:category_id, :content)
  end
end
