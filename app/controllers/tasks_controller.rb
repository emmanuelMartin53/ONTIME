class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
    @categories = Category.all
    @tasks_grouped = @tasks.group_by(&:category)
    @task = Task.new
  end

  def create
    @tasks = current_user.tasks
    @categories = Category.all
    @tasks_grouped = @tasks.group_by(&:category)
    @task = Task.new(task_params)
    @task.taskable = current_user

    redirect_target = params[:return_to].presence || flight_tasks_path(@task.taskable)

    if @task.save
      respond_to do |format|
        format.turbo_stream {render turbo_stream: turbo_stream.append("flush-collapse#{@task.category.name.gsub(" ", "-")}", partial: "tasks/task", locals: {task: @task, category: @task.category})}
        format.html {redirect_to redirect_target}
      end
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_target = params[:return_to].presence || tasks_path
    respond_to do |format|
      format.turbo_stream {render turbo_stream: turbo_stream.remove("task_#{@task.id}")}
      format.html {redirect_to redirect_target, notice: "Votre tâche a bien été supprimée"}
    end
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
