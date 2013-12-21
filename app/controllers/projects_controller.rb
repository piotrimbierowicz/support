class ProjectsController < ApplicationController

  before_filter :authenticate_admin, :except => [:index, :show, :questions]

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = 'Projekt utworzony pomyslnie!'
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
    @project = Project.find(params[:id])
  end

  def new_question
    @project = Project.find(params[:id])
    @question = @project.questions.new
  end
end
