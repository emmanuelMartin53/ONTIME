class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
    @tasks_grouped = @tasks.group_by(&:category)
    @admin = Category.find_by(name: "Administratif")
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @task.save
    redirect_to tasks_path()
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

#   def edit
#     @task = Task.find(params[:id])
#   end

#   def update
#     @task = Task.find(params[:id])
#     @task.update(task_params)
#     redirect_to task_path
#   end

    private

  def task_params
    params.require(:task).permit(:category_id, :content)
  end
end
