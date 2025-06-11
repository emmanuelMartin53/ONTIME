class Flights::TasksController < ApplicationController
  def index
    @flight = Flight.find(params[:flight_id])
    @categories = Category.all
    @tasks = Task.where(taskable: @flight)
    @tasks_grouped = @tasks.group_by(&:category)
    @task = Task.new

  end

  def create
    @task = Task.new(task_params)
    @categories = Category.all
    @tasks = Task.where(taskable: @flight)
    @tasks_grouped = @tasks.group_by(&:category)
    @flight = Flight.find(params[:flight_id])
    @task.taskable = @flight

    if @task.save
      if task_params[:add_to_user_list] == "1"
        new_user_task = Task.new(content: task_params[:content], category_id: task_params[:category_id])
        new_user_task.taskable = current_user
        new_user_task.save
      end
      respond_to do |format|
        format.turbo_stream {render turbo_stream: turbo_stream.append("flush-collapse#{@task.category.name.gsub(" ", "-")}", partial: "tasks/task", locals: {task: @task, category: @task.category})}
        format.html {redirect_to flight_tasks_path(@flight)}
      end
    else
      render :index, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to flight_tasks_path(@task.taskable), notice: "Tâche terminée"
    else
      redirect_to flight_tasks_path(@task.taskable), alert: "Erreur"
    end
  end

  private

  def task_params
    params.require(:task).permit(:category_id, :content, :add_to_user_list, :done)
  end
end
