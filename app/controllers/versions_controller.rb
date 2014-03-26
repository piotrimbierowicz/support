class VersionsController < ApplicationController

  before_filter :except => [:show] do
    @project = current_user.projects.find(params[:id])
  end

  def index
    @versions = @project.versions
  end

  def new
    @version = Version.new
  end

  def create
    @version = Version.new(params[:version])
    @version.project_id = @project.id
    @version.version_status = Version::New
    if @version.save
      flash[:notice] = 'Nowy etap zostal utworzony'
      redirect_to action: 'index'
    else
      flash[:alert] = 'Wystapil problem'
      render :new
    end
  end

  def show
    @version = Version.find(params[:id])
    @project = @version.project
  end

end