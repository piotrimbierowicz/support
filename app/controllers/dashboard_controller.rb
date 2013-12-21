class DashboardController < ApplicationController

  def home
    @projects = Project.all
    if @projects.size == 1
      redirect_to project_path(@projects.first)
    end
  end

end