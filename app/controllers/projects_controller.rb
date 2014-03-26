class ProjectsController < ApplicationController

  before_filter :authenticate_admin, :except => [:index, :show, :questions]

  def show
    @project = current_user.projects.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = 'Projekt utworzony pomyslnie!'
      current_user.project_ids << @project.id
      current_user.save!
      redirect_to project_path @project
    else
      flash[:alert] = 'Wystapil blad.'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def questions
    @project = current_user.projects.find(params[:id])
  end

  def new_question
    @project = current_user.projects.find(params[:id])
    @question = @project.questions.new
  end
end
