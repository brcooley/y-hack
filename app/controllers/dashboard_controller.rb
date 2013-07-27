class DashboardController < ApplicationController
  def index
    @tasks = current_user.tasks.order("finished").reverse
  end
end
