class TasksController < ApplicationController

  def index
  end

  def create
    puts params
    current_user.tasks.create(params[:task])
    @tasks = current_user.tasks
    respond_to do |format|
      format.js
    end
  end

end
