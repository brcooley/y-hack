class TasksController < ApplicationController

  def index
  end

  def create
    @task = current_user.tasks.create(params[:task])
    @tasks = current_user.tasks.reverse
    respond_to do |format|
      format.js
    end
    @task.analyze
  end

  def edit
  end

  def show
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @tasks = current_user.tasks.reverse
    respond_to do |format|
      format.js
    end
  end

  def start
    @task = Task.find(params[:id])
    @task.start_task
  end

  def finish
    @task = Task.find(params[:id])
    @task.finish_task(params[:time_elapsed])
  end

end
