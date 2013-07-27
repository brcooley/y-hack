class TasksController < ApplicationController

  def index
  end

  def create
    @task = current_user.tasks.create(params[:task])
    @task.analyze
    @tasks = current_user.tasks
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @tasks = current_user.tasks
    respond_to do |format|
      format.js
    end
  end

end
