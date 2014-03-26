class DashboardController < ApplicationController

  def home
    @projects = current_user.projects
    if @projects.size == 1
      redirect_to project_path(@projects.first)
    end
  end

end