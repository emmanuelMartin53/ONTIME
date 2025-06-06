class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.where(flight_id: nil)
    @tasks_grouped = @tasks.group_by(&:category)
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user

    if @task.save
      redirect_to tasks_path()
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_target = params[:return_to].presence || tasks_path
    redirect_to redirect_target, notice: "Votre tâche a bien été supprimée"
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
