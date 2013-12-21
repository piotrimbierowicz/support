class QuestionsController < ApplicationController

  before_filter :authenticate_admin, :only => [:destroy]

  def create
    @question = Question.new(params[:question])
    @question.author = current_user
    if @question.save
      flash[:notice] = 'Pytanie pomyslnie utworzone!'
      redirect_to questions_project_path(@question.project_id)
    else
      flash[:error] = 'Wystapil blad.'
      @project = @question.project
      render 'projects/new_question'
    end
  end

  def show
    @question = Question.find(params[:id])
    @project = @question.project
    @answer = Answer.new
    @answer.question_id = @question.id
  end

  def destroy
    @question = Question.find(params[:id])
    @project = @question.project
    @question.delete
    flash[:notice] = 'Pytanie zostalo pomyslnie usuniete!'
    redirect_to questions_project_path(@project)
  end

end