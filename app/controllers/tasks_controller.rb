class TasksController < ApplicationController

  def index
  end

  def create
    current_user.tasks.create
    @tasks = current_user.tasks
    respond_to do |format|
      format.js
    end
  end

end
