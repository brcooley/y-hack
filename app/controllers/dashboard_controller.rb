class DashboardController < ApplicationController
  def index
    @task = current_user.tasks.new
  end
end
