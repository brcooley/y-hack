class DashboardController < ApplicationController
  def index
    @tasks = current_user.tasks.reverse
  end
end
